class CommentsController < ApplicationController
  before_filter :require_user
  before_filter :get_article

  def create
  end

  def update
  end

  def destroy
  end

  private
  def get_article
    @article = Article.find(params[:article_id])
  end

end
