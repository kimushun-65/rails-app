class BoardsController < ApplicationController
  def index
    @boards =Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to boards_path, notice: '掲示板を作成しました'
    else
      render :new
    end
  end
  
  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to @board, notice: '掲示板を更新しました'
    else
      render :edit
    end
  end

  private

  def board_params
    params.require(:board).permit(:author_name, :title, :body)
  end
end
