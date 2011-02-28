require 'spec_helper'

describe Article do
  context 'validations' do
    it "should create a new instance given valid attributes" do
      Article.create!(:title => 'title', :content => 'content')
    end

    it 'is invalid when no title exists' do
      Article.create(:content => "asdf").should be_invalid
    end

    it 'is invalid when no content exists' do
      Article.create(:title => 'asdfasf').should be_invalid
    end
  end

end
