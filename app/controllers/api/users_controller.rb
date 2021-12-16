<<<<<<< HEAD
class Api::UsersController < ApplicationController
  before_action :capitalize_params

  def create
    @user = User.new(user_params)
    if @user.save
      render json: {
        user: @user
      }, status: 200
    else
      render json: {
        error: @user.errors.full_messages
      }, status: 422
    end
  end

  def login
    @user = User.find_by(username: params[:username])
    if @user
      @games = @user.games
      @reservations = @user.reservations
      render json: {
        id: @user.id,
        username: @user.username,
        games: @games,
        reservations: @reservations
      }, status: 200
    else
      render json: {
        error: 'No user was found with that name'
      }, status: 422
    end
  end

  private

  def user_params
    params.permit(:username)
  end

  def capitalize_params
    params[:username]&.capitalize!
  end
end
=======
class Api::UsersController < ApplicationController
  before_action :capitalize_params

  def create
    @user = User.new(user_params)
    if @user.save
      @games = @user.games
      @reservations = @user.reservations
      render json: {
        id: @user.id,
        username: @user.username,
        games: @games,
        reservations: @reservations
      }, status: 200
    else
      render json: {
        error: @user.errors.full_messages
      }, status: 422
    end
  end

  def login
    @user = User.find_by(username: params[:username])
    if @user
      @games = @user.games
      @reservations = @user.reservations
      render json: {
        id: @user.id,
        username: @user.username,
        games: @games,
        reservations: @reservations
      }, status: 200
    else
      render json: {
        error: 'No user was found with that name'
      }, status: 422
    end
  end

  def api_docs
    redirect_to '/api-docs'
  end

  private

  def user_params
    params.permit(:username)
  end

  def capitalize_params
    params[:username]&.capitalize!
  end
end
>>>>>>> 9e34008bca8b602d22488f74920724ecae46d240
