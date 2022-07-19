class HotelsController < ApplicationController
  before_action :set_hotel, only: %i[show edit update destroy]
  before_action :set_labels, only: %i[new edit]

  def index
    @hotels = policy_scope(Hotel)
  end

  def show; end

  def new
    authorize Hotel
    @hotel = Hotel.new
  end

  def create
    authorize Hotel
    @hotel = current_user.hotels.build(hotel_params)
    if @hotel.save
      flash[:success] = 'Hotel was successfuly created'
      redirect_to root_path
    else
      flash[:danger] = @hotel.errors.full_messages.join(', ')
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
      flash[:danger] = @hotel.errors.full_messages.join(', ') do |msg|
        msg
      end
    end
    redirect_to edit_hotel_path(@hotel)
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
    params.require(:hotel).permit(:name, :address, :description, :city,{images: []}, label_ids: [])
  end

  def set_labels
    @labels = Label.all
  end

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end
end
