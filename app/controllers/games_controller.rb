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
      redirect_to @game
    else
      render :new
    end
  end

  def update
    letter = params[:games][:guess]
    @game.guess(letter)
    redirect_to @game, notice: 'Homework was successfully updated.'
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:answer, :max_misses, :misses, :guessed)
  end
end
