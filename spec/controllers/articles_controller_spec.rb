require 'spec_helper'

describe ArticlesController do

  describe "GET 'index'" do
    it 'assigns all articles' do
      get :index
      assigns[:articles].should == []
    end
  end

  describe "GET #new" do
    it 'redirects non-logged in users back to login page' do
      get :new
      response.should redirect_to(new_user_session_path)
    end

    it 'allows logged in users to access page' do
      execute_login
      get :new
      response.should be_success
    end

  end

  context 'logged in' do
    before :each do
      execute_login
      @article = Factory.stub(:article, :id => 12)
#      mock(controller).current_user {Factory.stub(:user)}
    end

    describe "POST #create" do
      it 'allows logged in users to create articles' do
        mock(Article).new(nil) {@article}
        mock(@article).save {true}
        
        post :create
        response.should redirect_to(articles_path)
      end

      it 'redirects user to article page once created successfully' do
        params = {'title' => 'foo', 'content' => 'bar'}
        mock(Article).new(params) {@article}
        mock(@article).save {true}
        
        post :create, :article => params
        response.should redirect_to(articles_path)
      end

      it 'redirects the user back to new page when article is invalid' do
        mock(Article).new(nil) {@article}
        mock(@article).save {false}

        post :create
        response.should render_template(:new)
      end

    end
  end

  context 'not logged in' do
    describe "POST #create" do
      it 'redirects non-logged in users back to login page' do
        post :create
        response.should redirect_to(new_user_session_path)
      end
    end
  end



end
