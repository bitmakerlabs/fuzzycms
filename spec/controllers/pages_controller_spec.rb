require 'spec_helper'

describe PagesController do
  describe "#index" do
    before do
      execute_login
    end

    it 'is successful' do
      get :index, :article_id => 12
      response.should be_success
    end
  end

  describe '#edit' do
    it 'is successful when logged in' do
      execute_login
      mock(Page).find(12) {nil}

      put :edit, :id => 12
      response.should render_template(:edit)
    end

    it 'redirects to login when user not logged in' do
      put :edit, :id => 12
      response.should redirect_to(new_user_session_path)
    end

  end

end
