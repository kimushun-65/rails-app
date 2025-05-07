class BoardsController < ApplicationController
  def index
    @boards = []  # 将来的にはBoard.allなどに置き換える
  end
end
