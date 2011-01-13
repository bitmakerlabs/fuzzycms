require 'spec_helper'

describe UserSessionsController do
  describe '#new' do
    it 'creates a new UserSession' do
      get :new
      assigns[:user_session] == UserSession.new
    end
  end

  describe '#create' do
    it 'successfully logs a user in' do
      user = Factory.create(:user, :email => 'bob@example.com')
      post :create, :user_session => { :email => 'bob@example.com', :password => 'password' }
      assigns[:user_session].user.should == user
    end

    it 'puts Login successful! in the flash notice' do
      Factory.create(:user, :email => 'bob@example.com')

      post :create, :user_session => { :email => 'bob@example.com', :password => 'password' }
      flash[:notice].should == "Login successful!"
    end
  end

  describe '#destroy' do
    before(:each) do
      activate_authlogic
      @current_user = Factory.build(:user)
      UserSession.create!(@current_user)
    end

    it 'calls destroy on current_user_session object' do
      post :destroy
      response.should redirect_to(root_url)
    end

    it 'puts success message in flash' do
      post :destroy
      flash[:notice].should == "Logout successful!"
    end
  end
end