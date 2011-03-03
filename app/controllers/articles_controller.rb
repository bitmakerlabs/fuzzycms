class ArticlesController < ApplicationController
  before_filter :require_user, :except => [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create!(params[:article])
    flash[:notice] = "Article successfully created."

    redirect_to articles_path
  end

end
