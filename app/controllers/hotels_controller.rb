class HotelsController < ApplicationController
  before_action :set_hotel, only: %i[show edit update destroy]
  before_action :set_labels, only: %i[new edit]

  def index
    @hotels = policy_scope(Hotel).all
    @hotels_count = policy_scope(Hotel).count
  end

  def show; end

  def new
    authorize Hotel
    @hotel = Hotel.new
  end

  def create
    authorize Hotel
    @hotel = current_user.hotels.create(hotel_params)
    if @hotel.save
      flash[:success] = 'Hotel was successfuly created'
      redirect_to root_path
    else
      flash[:danger] = 'Something wrong..'
      redirect_to new_hotel_path
    end
  end

  def edit
    authorize @hotel
  end

  def update
    authorize @hotel
    if @hotel.update(hotel_params)
      flash[:success] = 'Hotel was successfuly updated'
    else
      flash[:danger] = 'Something wrong..'
    end
    redirect_to root_path
  end

  def destroy
    authorize @hotel
    if @hotel.destroy
      flash[:success] = 'Room was successfuly destroy'
    else
      flash[:danger] = 'Something wrong..'
    end 
  end
  

  private

  def hotel_params
    params.require(:hotel).permit(:name, :address, :description, :city, label_ids: [])
  end

  def set_labels
    @labels = Label.all
  end

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end
end
