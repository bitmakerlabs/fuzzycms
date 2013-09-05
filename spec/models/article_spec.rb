require 'spec_helper'

describe Article do
  it "should contain a title" do
    article = Article.new

    expect(article).to_not be_valid
  end
end
