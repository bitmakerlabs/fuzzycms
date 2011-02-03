require 'spec_helper'

describe User do

  describe '#full_name' do
    it 'returns the first and last name as one field' do
      user = Factory(:user, :first_name => 'Bob', :last_name => 'Smith')
      user.full_name.should == 'Bob Smith'
    end
  end
  
end