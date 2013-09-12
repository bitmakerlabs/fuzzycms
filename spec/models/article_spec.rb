require 'spec_helper'

describe Article do
  let(:article) {FactoryGirl.build(:article, :title => nil)}

  it "should contain a title" do
    expect(article).to_not be_valid
  end
end
