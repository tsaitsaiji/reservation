class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservation_success_path(@reservation.id)
    else
      render :new
    end
  end

  def success
    @reservation = Reservation.find(params[:id])
  end

  def check
    @reservations = Reservation.all
  end

  def observe
    @reservations = Reservation.all
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservation_observe_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:name, :phone, :date, :time)
  end
end