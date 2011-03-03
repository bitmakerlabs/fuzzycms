require 'spec_helper'

describe ArticlesController do

  describe "GET 'index'" do
    it 'assigns all articles' do
      get :index
      assigns[:articles].should == []
    end
  end

  describe "GET #new" do
    it 'redirects non-logged in users back to root_url' do
      get :new
      response.should redirect_to(new_user_session_path)
    end

    it 'allows logged in users to access page' do
      execute_login
      get :new
      response.should be_success
    end

  end
end
