class Api::ReservationsController < ApplicationController
  before_action :capitalize_params, only: [:create]

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: {
        reservation: @reservation
      },
             status: 200
    else
      render json: {
        error: @reservation.errors.full_messages
      },
             status: 422
    end
  end

  def delete
    @reservation = Reservation.find(params[:id])
    @reservation.delete

    render json: {
      message: 'Successfully Deleted'
    },
           status: 200
  end

  def update
    @reservation = Reservation.find(params[:id])

    if params[:reservation_date] && params[:retrieval_date]
      @reservation.update(reservation_date: params[:reservation_date], retrieval_date: params[:retrieval_date])
      render json: {
        message: 'Successfully Updated',
        reservation: @reservation
      },
             status: 200
    elsif params[:reservation_date]
      @reservation.update(reservation_date: params[:reservation_date])
      render json: {
        message: 'Reservation date Successfully Updated',
        reservation: @reservation
      },
             status: 200
    elsif params[:retrieval_date]
      @reservation.update(retrieval_date: params[:retrieval_date])
      render json: {
        message: 'Retrieval date Successfully Updated',
        reservation: @reservation
      },
             status: 200
    else
      render json: {
        error: 'Please provide a reservation date'
      },
             status: 422
    end
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
    params[:location]&.capitalize!
  end
end
