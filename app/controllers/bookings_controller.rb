class BookingsController < ApplicationController
  before_action :set_doll, only:[:new, :create]

  def my_bookings
    # display all my booking requests
    @user = current_user
    @user_bookings = Booking.where('user_id=?', @user.id)
    # display all the booking requests made for my doll
    @bookings = Booking.all

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

  def status
    @booking = Booking.find(params[:id])
  end

  def set_status
    @booking = Booking.find(params[:id])
    @booking.status = params[:status]
    @booking.save
    redirect_to my_bookings_path
  end

  private

  def set_doll
    @doll = Doll.find(params[:doll_id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :booking_start_date, :booking_end_date, :status)
  end
end
