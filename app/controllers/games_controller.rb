# Adding Games Controller
class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update]
  def index
    @games = Game.all
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if params[:games] && params[:games][:guess]
      letter = params[:games][:guess]
      @game.guess(letter)
      redirect_to @game
    else
      @game[:winner] = params[:game][:winner]
      @game.save
      redirect_to root_path
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:answer, :max_misses, :misses, :guessed, :creator)
  end
end
