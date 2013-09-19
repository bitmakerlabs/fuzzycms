require 'spec_helper'

describe ArticlesController do
  it "should call all on Article" do
    Article.stub(:all)
    get :index
    expect(response.status).to eq(200)
  end

  it "should assign articles to @articles" do
    Article.stub(:all).and_return([])
    get :index
    expect(assigns[:articles]).to eq([])
  end
  
  it 'should return all the articles' do
    article1 = FactoryGirl.create(:article)
    article2 = FactoryGirl.create(:article, :title => "another article")
    
    get :index
    
    assigns[:articles].should =~ [article1, article2]
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
