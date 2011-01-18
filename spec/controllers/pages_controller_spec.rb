require 'spec_helper'

describe PagesController do

  describe '#edit' do
    it 'is successful when logged in' do
      execute_login
      
      post :edit
      response.should render_template(:edit)
    end

    it 'redirects to login when user not logged in' do
      post :edit
      response.should redirect_to(new_user_session_path)
    end

  end

end
