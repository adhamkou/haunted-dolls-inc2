class BookingsController < ApplicationController
  before_action :set_doll, only:[:new, :create]

  def my_bookings
    @owner_bookings = current_user.owner_bookings
    @user_bookings = Booking.where(user: current_user)
  end

  def set_status
    @booking = Booking.find(params[:id])
    @booking.status = params[:status]
    @booking.save
    redirect_to my_bookings_path
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.doll = @doll
    @booking.user = current_user
    if @booking.save
      redirect_to my_bookings_path, notice: 'Booking was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end



  private

  def set_doll
    @doll = Doll.find(params[:doll_id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :booking_start_date, :booking_end_date, :status)
  end
end
