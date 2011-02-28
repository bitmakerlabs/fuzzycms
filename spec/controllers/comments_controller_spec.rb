require 'spec_helper'

describe CommentsController do

  before do
    execute_login
  end
  
  describe "GET 'create'" do
    it "should be successful" do
      mock(Article).find("12") {nil}
      get 'create', :article_id => "12"
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "should be successful" do
      mock(Article).find("12") {nil}
      get 'update', :article_id => "12"
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "should be successful" do
      mock(Article).find("12") {nil}
      get 'destroy', :article_id => "12"
      response.should be_success
    end
  end

end
