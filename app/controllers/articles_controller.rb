class ArticlesController < ApplicationController
  before_filter :require_login, :except => [:index]

  def index
    page = params[:page] || 1
    @articles = Article.order(:created_at).page(page)
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @user = current_user
    @article = @user.articles.new article_parameters

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes article_parameters

    if @article.save
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to action: "index"
  end

  private
  def article_parameters
    params.require(:article).permit(:title, :body, :image, :category_id)
  end
end
