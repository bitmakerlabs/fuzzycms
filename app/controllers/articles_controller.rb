class ArticlesController < ApplicationController
  before_filter :require_user, :except => [:index, :show]

  def index
    @articles = Article.order("created_at").all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.user = current_user

    if @article.save
      flash[:notice] = "Article successfully created."
      redirect_to articles_path
    else
      render :action => "new"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to articles_path, :notice => "Article updated successfully"
    else
      render :action => "edit"
    end
  end

  def destroy
    Article.destroy(params[:id])
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end

end
