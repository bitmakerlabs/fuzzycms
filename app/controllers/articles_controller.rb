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
    @article = Article.new(params[:article])
    logger.info "\n\ncurrent_user = #{current_user.inspect}"
    @article.author = current_user

    if @article.save
      flash[:notice] = "Article successfully created."
      redirect_to @article
    else
      render :action => "new"
    end

  end

end
