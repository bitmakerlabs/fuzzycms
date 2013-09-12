require 'spec_helper'

describe Comment do
  it "should always belong to an article" do
    comment = Comment.new(:article => nil, :body => "asdfasdf")
    expect(comment).to_not be_valid
  end

  it "should do someting complicated" do
    article = FactoryGirl.build(:article)
    FactoryGirl.build(:comment, :article => article)
  end
end
