require 'spec_helper'

describe Article do
  context 'validations' do
    it "should create a new instance given valid attributes" do
      Article.create!(:title => 'title', :content => 'content', :author => Factory(:user)).should be_valid
    end

    it 'is invalid when no title exists' do
      Article.create(:content => "asdf", :author => Factory(:user)).should be_invalid
    end

    it 'is invalid when no content exists' do
      Article.create(:title => 'asdfasf', :author => Factory(:user)).should be_invalid
    end

    it 'is invalid when no user exists' do
      Article.create(:title => 'foo', :content => 'bar').should be_invalid
    end
  end

  context 'activity log' do
    it 'creates an Activity object when an article is created' do
      
    end
  end

end
