class Api::ReservationsController < ApplicationController
  before_action :capitalize_params, only: [:create]

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: {
        reservation: @reservation
      }
    else
      render json: {
        error: @reservation.errors.full_messages
      }
    end
  end

  def delete
    @reservation = Reservation.find(params[:id])
    @reservation.delete

    render json: {
      message: 'Successfully deleted'
    }
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_date: params[:reservation_date], retrieval_date: params[:retrieval_date])

    render json: {
      message: 'Successfully Updated',
      reservation: @reservation
    }
  end

  private

  def reservation_params
    params.permit(
      :buyer_id,
      :game_id,
      :reservation_date,
      :retrieval_date,
      :location
    )
  end

  def capitalize_params
    params[:location].capitalize!
  end
end
