require 'spec_helper'

describe CommentsController do

  context 'logged in' do
    before do
      execute_login
      @article = Factory.build(:article, :id => 12)
    end

    describe "GET 'create'" do
      
      it "redirects back to ??? when article does not exist" do
        mock(Article).find("12") {nil}
        post 'create', :article_id => "12"
        response.should redirect_to(root_url)
      end

      it 'redirects back to article' do
        params = {"comment" => 'blah'}
        mock(Article).find("12") {@article}
        mock(@article).comments {stub!.create(params) {true}}
        post :create, :article_id => "12", :comment => {:comment => 'blah'}
        response.should redirect_to(article_path(@article))
      end

      it 'saves the comment' do
        params = {"comment" => 'blah'}
        mock(Article).find("12") {@article}
        mock(@article).comments {stub!.create(params) {true}}
        post :create, :article_id => "12", :comment => params
      end
    end

    describe "GET 'update'" do
      it "is successful" do
        mock(Article).find("12") {@article}
        get 'update', :article_id => "12"
        response.should be_success
      end
    end

    describe "GET 'destroy'" do
      it "is successful" do
        mock(Article).find("12") {@article}
        get 'destroy', :article_id => "12"
        response.should be_success
      end
    end
  end

  context 'not logged in' do
    describe "GET 'create'" do
      it "redirects to login path" do
        get 'create', :article_id => "12"
        response.should redirect_to(new_user_session_path)
      end
    end

    describe "GET 'update'" do
      it "redirects to login path" do
        get 'update', :article_id => "12"
        response.should redirect_to(new_user_session_path)
      end
    end

    describe "GET 'destroy'" do
      it "redirects to login path" do
        get 'destroy', :article_id => "12"
        response.should redirect_to(new_user_session_path)
      end
    end
  end


end
