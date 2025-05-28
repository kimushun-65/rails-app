class BoardsController < ApplicationController
  before_action :set_target_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards =Board.page(params[:page]).per(10)
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      flash[:notice] = "「#{@board.title}」の掲示板を作成しました"
      redirect_to boards_path
    else
      flash.now[:alert] = "掲示板の作成に失敗しました"
      render :new
    end
  end
  
  def show
    @comment = Comment.new(board_id: @board.id)
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to @board, notice: '掲示板を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path, notice: '掲示板を削除しました'
  end

  private

  def board_params
    params.require(:board).permit(:author_name, :title, :body, tag_ids: [])
  end
  def set_target_board
    @board = Board.find(params[:id])
  end
end
