class HotelsController < ApplicationController
  before_action :set_hotel, only: %i[ show edit update ]
  before_action :set_labels, only: %i[ new edit ]
  def index
    @hotels = policy_scope(Hotel).all
    @hotels_count = policy_scope(Hotel).count
  end

  def show; end

  def new
    @hotel = Hotel.new
    authorize @hotel
  end

  def create
    @hotel = Hotel.create(hotel_params)
    authorize @hotel
    if @hotel.save
      flash[:success] = 'Hotel was successfuly created'
      redirect_to root_path
    else
      flash[:danger] = 'Something wrong..'
      redirect_to root_path
    end
  end

  def edit
    authorize @hotel
  end

  def update
    authorize @hotel
    if @hotel.update(hotel_params)
      flash[:success] = 'Hotel was successfuly updated'
      redirect_to root_path
    else
      flash[:danger] = 'Something wrong..'
      redirect_to root_path
    end
  end
  
  

  private
  def hotel_params
    params.require(:hotel).permit(:name, :address, :description, :city, label_ids: []).merge(:user_id => @user.id)
  end

  def set_labels
    @labels = Label.all
  end
  
  
  def set_hotel
    @hotel = Hotel.find(params[:id])
  end
  
end
