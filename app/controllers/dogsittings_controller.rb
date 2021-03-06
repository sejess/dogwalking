class DogsittingsController < ApplicationController
  before_action :set_dogsitting, only: [:show]

  def index
    @dogsittings = Dogsitting.all
  end

  def show
  end

  def new
    @dogsitting = Dogsitting.new
  end

  def create
    @dogsitting = Dogsitting.new(dogsitting_params)
    @dogsitting.user = current_user
    if @dogsitting.save
      redirect_to dogsitting_path(@dogsitting)
    else
      render :new
    end
  end

  private

  def set_dogsitting
    @dogsitting = Dogsitting.find(params[:id])
  end

  def dogsitting_params
    params.require(:dogsitting).permit(:location)
  end
end
