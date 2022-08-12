class HotelsController < ApplicationController
  before_action :set_hotel, except: %i[index new create]
  before_action :set_labels, only: %i[new edit]
  def index
    @search = Search.new
    @pagy, @hotels = pagy(policy_scope(Hotel.includes(:rooms).order("#{params[:sort]} #{params[:direction]}").references(:rooms)))
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
      flash[:danger] = @hotel.errors.full_messages.join(', ')
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

  def add_images
    authorize Hotel
    add_more_images(hotel_params[:images])
    flash[:error] = 'Failed uploading images' unless @hotel.save
    redirect_to root_path
  end

  def destroy_img
    authorize Hotel
    destroy_image_at_index(params[:id].to_i)
    flash[:error] = 'Failed deleting image' unless @hotel.save
    redirect_to root_path
  end

  def set_main_image
    authorize Hotel
    index = params[:id].to_i
    flash[:error] = 'Failed' unless @hotel.update(main_image: @hotel.images[index].url)
    redirect_to root_path
  end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :address, :description, :city, { label_ids: [] }, { images: [] })
  end

  def set_labels
    @labels = Label.all
  end

  def set_hotel
    @hotel = Hotel.find(params[:hotel_id] || params[:id])
  end

  def add_more_images(new_images)
    images = @hotel.images
    images += new_images
    @hotel.images = images
  end

  def destroy_image_at_index(index)
    hotel_images = @hotel.images
    if index.zero? && @hotel.images.size == 1
      @hotel.remove_images!
    else
      deleted_image = hotel_images.delete_at(index)
      deleted_image.try(:remove!)
      @hotel.images = hotel_images
    end
  end

  def sort_column
    Hotel.column_names.include?(params[:sort] || 'name')
  end

  def sort_direction
    %w[ask desk].include?(params[:direction] || 'ask')
  end
end
