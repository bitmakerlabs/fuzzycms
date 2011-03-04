require 'spec_helper'

describe Page do

  it 'requires a title' do
    Page.new(:content => 'foo').should be_invalid
  end
end
