class PlaysController < ApplicationController
  before_action :set_play, only: [:show]

  # GET /plays/1
  # GET /plays/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_play
    @play = Play.find(params[:id])
  end
end
