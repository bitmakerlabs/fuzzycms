class CommentMailer < ActionMailer::Base
  default from: "info@fuzzycms.com"

  def comment_email(user, article)
    @user = user
    @article = article
    mail(to: @user.email, subject: "A new comment")
  end
end
