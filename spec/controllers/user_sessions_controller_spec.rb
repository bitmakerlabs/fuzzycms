require 'spec_helper'

describe UserSessionsController do
#  before do
#    activate_authlogic
#  end

  describe '#new' do

  end

  describe '#create' do
    it 'successfully logs a user in' do
      user = Factory.create(:user, :email => 'bob@example.com')
      post :create, :user_session => { :email => 'bob@example.com', :password => 'password' }
      
      assigns(:user_session).user.should == user
    end

    it 'puts Login successful! in the flash notice' do
      Factory.create(:user, :email => 'bob@example.com')

      post :create, :user_session => { :email => 'bob@example.com', :password => 'password' }
      flash[:notice].should == "Login successful!"
    end
  end

  describe '#destroy' do
    before do
      stub(controller).require_user { true }
    end

    it 'calls destroy on current_user_session object' do
      mock(controller).current_user_session.times(any_times) { mock!.destroy {} }
      post :destroy
    end

    it 'puts success message in flash' do
      stub(controller).current_user_session.times(any_times) { stub!.destroy {} }
      post :destroy
      flash[:notice].should == "Logout successful!"
    end
  end
end