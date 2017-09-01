class CommentsController < ApplicationController

  def vote
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    Vote.create(voteable: @comment, vote: params[:vote])
    redirect_to article_path(@article)
  end


  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(params.require(:comment).permit(:body))

    if @comment.save
      redirect_to article_path(@article)
    else
      render 'articles/show'
    end
  end
end
