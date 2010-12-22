require 'spec_helper'

describe ArticlesController do

  describe "GET 'index'" do
    it 'assigns all articles' do
      get :index
      assigns[:articles].should == []
    end
  end
end
