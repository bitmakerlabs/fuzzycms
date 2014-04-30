class ArticlesController < ApplicationController
  before_filter :require_login, :except => [:index, :show]
  load_and_authorize_resource

  def index
    page = params[:page] || 1

    if params[:tag]
      @articles = Article.tagged_with(params[:tag]).order(:created_at).page(page)
    else
      @articles = Article.order(:created_at).page(page)
    end
  end

  def show
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new article_parameters

    if @article.save
      redirect_to @article, notice: "Article created successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update_attributes article_parameters
      redirect_to @article, notice: "Article updated successfully"
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
    params.require(:article).permit(:title, :body, :image, :category_id, :tag_list)
  end
end
