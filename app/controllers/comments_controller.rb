class CommentsController < ApplicationController
  
  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new comment_parameters
    @comment.article = @article
    if @comment.save
      redirect_to @article, :notice => "Comment successfully added"
    else
      redirect_to @article, :error => "Something went wrong saving your comment"
    end
  end
  
  def update
  end
  
  def destroy
  end

  private
  def comment_parameters
    params.require(:comment).permit(:body)
  end
end
