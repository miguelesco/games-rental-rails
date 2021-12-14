class Api::GamesController < ApplicationController
  before_action :capitalize_params, only: [:create]

  def create
    @game = Game.new(game_params)
    if @game.save
      render json: {
        game: @game
      },
             status: 200
    else
      render json: {
        error: @game.errors.full_messages
      },
             status: 422
    end
  end

  def retrieve
    @games = Game.all
    if @games
      render json: {
        games: @games
      },
             status: 200
    else
      render json: {
        error: 'No games were found with that name'
      },
             status: 422
    end
  end

  def delete
    @game = Game.find(params[:id])
    @game.delete

    render json: {
      message: 'Successfully deleted'
    },
           status: 200
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
    params[:name]&.capitalize!
    params[:category]&.capitalize!
  end
end
