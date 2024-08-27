class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype), notice: 'コメントが投稿されました。'
    else
      redirect_to prototype_path(@comment.prototype), alert: 'コメントの投稿に失敗しました'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
