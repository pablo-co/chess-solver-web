class GameBoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :piece_attrs, only: [:new, :create, :edit]

  # GET /boards
  # GET /boards.json
  def index
    @boards = GameBoard.paginate(page: params[:page])
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
  end

  # GET /boards/new
  def new
    @board = GameBoard.new
    piece_attrs
  end

  # GET /boards/1/edit
  def edit
    piece_attrs
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = GameBoard.new(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'GameBoard was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'GameBoard was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'GameBoard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_board
    @board = GameBoard.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def board_params
    params.require(:game_board).permit(:name, :turn, pieces_attributes: [:kind, :color, :x, :y])
  end

  def piece_attrs
    @colors = Piece.colors
    @pieces = Piece.kinds
  end
end
