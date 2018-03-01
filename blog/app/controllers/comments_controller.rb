# Defines comment api behavior
class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])

    @comment = @article.comments.new
    @comment.commenter = current_user.email
    @comment.body = comment_params[:body]

    unless @comment.save
      error! @comment.errors, 400
    end

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
