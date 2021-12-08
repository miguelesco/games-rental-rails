class Api::UsersController < ApplicationController
  before_action :capitalize_params

  def create
    @user = User.new(user_params)
    if @user.save
      render json: {
        user: @user
      }
    else
      render json: {
        error: @user.errors.full_messages
      }
    end
  end

  def login
    @user = User.find_by(username: params[:username])
    if @user
      @games = @user.games
      @reservations = @user.reservations
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
