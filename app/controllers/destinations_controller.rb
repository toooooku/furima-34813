class DestinationsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    #@destination_shipping_address = DestinationShippingAddress.new
  end

  def new
    @destination_shipping_address = DestinationShippingAddress.new
  end  

  def create
    @destination_shipping_address = DestinationShippingAddress.new(destination_params)
    if @destination_shipping_address.valid?
      @destination_shipping_address.save
      redirect_to root_path
    else  
      render :new
    end  
  end  

  private

  def destination_params
    params.require(:destination_shipping_address).permit(:zip_code, :prefecture_id, :city, :adress, :building_name, :phone_number, :destination_id, :item_id).merge(user_id: current_user.id)
  end

end
