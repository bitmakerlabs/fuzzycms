class ArticlesController < ApplicationController
  before_filter :require_login, :except => [:index]

  def index
    page = params[:page] || 1

    if params[:tag]
      @articles = Article.tagged_with(params[:tag]).order(:created_at).page(page)
    else
      @articles = Article.order(:created_at).page(page)
    end
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

    # @article = Article.new(article_parameters)
    # @article.author = @user


    @article = @user.articles.new article_parameters

    if @article.save
      redirect_to @article, notice: "Article created successfully"
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
      redirect_to @article, notice: "Article updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    
    if !current_user.admin?
      redirect_to @article
    end
    
    @article.destroy
    redirect_to action: "index"
  end

  private
  def article_parameters
    params.require(:article).permit(:title, :body, :image, :category_id, :tag_list)
  end
end
