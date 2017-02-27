class CommentsController < ApplicationController
  before_filter :require_login, except: [:create]  
  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    if @comment.author_name.strip.length <= 0 then
      @comment.author_name = "Anon"
    end
    @comment.save
    
    redirect_to article_path(@comment.article)
  end
  
  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
