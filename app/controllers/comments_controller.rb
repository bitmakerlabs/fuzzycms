class CommentsController < ApplicationController
  
  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new comment_parameters
    @comment.article = @article

    respond_to do |format|
      if @comment.save
        CommentMailer.comment_email(current_user, @article).deliver
        format.html { redirect_to @article, :notice => "Comment successfully added" }
        format.json { render @comment.to_json }
      else
        format.html { redirect_to @article, :error => "Something went wrong saving your comment" }
      end
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
