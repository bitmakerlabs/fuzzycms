class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
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
