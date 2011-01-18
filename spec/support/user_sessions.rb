def execute_login
  activate_authlogic
  @user = Factory(:user)
  @user_session = UserSession.create(@user)
end
