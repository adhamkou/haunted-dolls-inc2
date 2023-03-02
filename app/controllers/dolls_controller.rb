class DollsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @dolls = Doll.all
    # The `geocoded` scope filters only dolls with coordinates
    @markers = @dolls.geocoded.map do |doll|
      {
        lat: doll.latitude,
        lng: doll.longitude,
        info_window_html: render_to_string(partial: 'info_window', locals: { doll: doll }),
        marker_html: render_to_string(partial: 'marker', locals: { doll: doll }) # Pass the
      }
    if params[:query].present?
      @dolls = Doll.search_by_name_and_location(params[:query])
    else
      @dolls = Doll.all
    end
  end

  def show
    @doll = Doll.find(params[:id])
  end

  def new
    @doll = Doll.new
  end

  def create
    @doll = Doll.new(doll_params)
    @user = current_user
    @doll.user = @user

    if @doll.save
      redirect_to doll_path(@doll)
    else
      render :new, status: unprocessable_entity
    end
  end

  def edit
    @doll = Doll.find(params[:id])
  end

  def update
    @doll = Doll.find(params[:id])
    @doll.update(doll_params)

    if @doll.save
      redirect_to doll_path(@doll)
    else
      render :new, status: unprocessable_entity
    end
  end

  def destroy
    @doll = Doll.find(params[:id])
    @doll.destroy
    redirect_to dolls_path
  end

  private

  def doll_params
    params.require(:doll).permit(:name, :description, :image, :price, :location)
  end
end
