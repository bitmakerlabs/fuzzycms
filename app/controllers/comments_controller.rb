class CommentsController < ApplicationController
  before_filter :require_user
  before_filter :get_article

  def create
    if @article.comments.create(params[:comment])
      redirect_to article_path(@article)
    end
  end

  def update
  end

  def destroy
  end

  private
  def get_article
    @article = Article.find(params[:article_id])
    redirect_to root_url if @article.nil?
  end

end
