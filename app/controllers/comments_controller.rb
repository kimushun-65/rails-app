class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to board_path(@comment.board), notice: 'コメントを投稿しました'
    else
      redirect_to board_path(@comment.board), alert: 'コメントの投稿に失敗しました'
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :comment, :board_id)
  end
end
