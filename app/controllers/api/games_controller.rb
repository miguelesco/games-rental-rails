class Api::GamesController < ApplicationController
  before_action :capitalize_params

  def create
    @game = Game.new(game_params)
    if @game.save
      render json: {
        game: @game
      }
    else
      render json: {
        error: @game.errors.full_messages
      }
    end
  end

  def retrieve
    @game = User.find_by(params[:id])
    if @game
      render json: {
        user: @user,
        games: @games,
        reservations: @reservations
      }
    else
      p params[:username]
      render json: {
        error: 'No user was found with that name'
      }
    end
  end

  private

  def user_params
    params.permit(:username)
  end

  def capitalize_params
    params[:username].capitalize!
  end
end
