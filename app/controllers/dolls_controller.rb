class DollsController < ApplicationController
  def index
    @dolls = Doll.all
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

  private

  def doll_params
    params.require(:doll).permit(:name, :description, :image, :price, :location)
  end
end