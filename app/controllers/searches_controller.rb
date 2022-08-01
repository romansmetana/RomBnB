class SearchesController < ApplicationController
  def new
    @search = Search.new
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
    @search.destroy
  end

  private

  def search_params
    params.require(:search).permit(:name, :city, :capacity, :min_price, :max_price)
  end
end
