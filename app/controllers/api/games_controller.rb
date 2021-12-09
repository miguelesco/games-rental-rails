class Api::GamesController < ApplicationController
  before_action :capitalize_params, only: [:create]

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
    @games = Game.all
    if @games
      render json: {
        games: @games
      }
    else
      render json: {
        error: 'No games were found with that name'
      }
    end
  end

  def delete
    @game = Game.find(params[:id])
    @game.delete

    render json: {
      message: 'Successfully deleted'
    }
  end

  private

  def game_params
    params.permit(
      :name,
      :category,
      :price,
      :icon,
      :description,
      :owner_id
    )
  end

  def capitalize_params
    params[:name].capitalize!
    params[:category].capitalize!
  end
end
