class BookingsController < ApplicationController
  before_action :set_doll, only:[:new, :create]

  def my_bookings
      # display all my booking requests
      @bookings = Booking.all
      # raise
      # display all the booking requests made for my doll
      @user = current_user
      # interator : @user.dolls
      # user.doll.bookings (display all the bookings belong_to this doll,using inside interator)
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

  def set_status
    @booking = Booking.find(params[:id])
    # if @view.booking_status == "accept"
    #     @booing.status = "accept"
    # else @view.booking_status == "decline"
    #     @booking.status = "decline"
    # end
    # @booking.update???(params[:booking])??
    # redirect_to: "...."
  end

  private

  def set_doll
    @doll = Doll.find(params[:doll_id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :booking_start_date, :booking_end_date, :status)
  end
end
