class HotelsController < ApplicationController

  def index
    puts " Im am here!!! "
    @hotels = Hotel.all
    render 'index'
  end

  def show
    @hotel = Hotel.find(params[:id])
    render 'show'
  end

  def new
    @hotel = Hotel.new
    render 'new'
  end

  def edit
    @hotel = Hotel.find(params[:id])
    render 'edit'
  end

  def create
    @hotel = Hotel.new(hotel_params)

    if @hotel.save
      redirect_to @hotel, notice: 'Hotel was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @hotel = Hotel.find(params[:id])
    if @hotel.update(hotel_params)
      redirect_to @hotel, notice: 'Hotel was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
    redirect_to hotels_url, notice: 'Hotel was successfully destroyed.'
  end

  private
  # Only allow a trusted parameter "white list" through.
  def hotel_params
    params.require(:hotel).permit(:name, :description, :picture)
  end

end
