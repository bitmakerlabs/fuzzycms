require 'spec_helper'

describe ArticlesController do

  describe "GET 'index'" do
    it 'assigns all articles' do
      get :index
      assigns[:articles].should == []
    end
  end

  describe "GET #new" do
    it 'redirects non-logged in users back to root_url'
    it 'allows logged in users to access page'
  end
end
