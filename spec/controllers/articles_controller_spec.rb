require 'spec_helper'

describe ArticlesController do
  it "should call all on Article" do
    Article.should_receive(:all)
    get :index
  end

  it "should assign articles to @articles" do
    Article.should_receive(:all).and_return([])
    get :index
    expect(assigns[:articles]).to eq([])
  end

  describe "#create" do
    let(:article_params) { {"title" => "title", "body" => "body"} }
    let!(:model) { FactoryGirl.build(:article) }

    it "should call new on Article" do
      Article.should_receive(:new).and_return(model)

      post :create, "article" => article_params
    end

    it "should assign new article" do
      Article.should_receive(:new).and_return(model)

      post :create, "article" => article_params

      expect(assigns[:article]).to eq(model)
    end

    
  end
end
