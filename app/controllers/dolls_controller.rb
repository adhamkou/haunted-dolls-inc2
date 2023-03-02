class DollsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

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
