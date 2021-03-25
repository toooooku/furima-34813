class DestinationsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @destination_shipping_address = DestinationShippingAddress.new
  end

  def new
    @destination_shipping_address = DestinationShippingAddress.new
  end  

  def create
    @item = Item.find(params[:item_id])
    @destination_shipping_address = DestinationShippingAddress.new(destination_params)
    if @destination_shipping_address.valid?
      pay_item
      @destination_shipping_address.save
      redirect_to root_path
    else  
      render :index
    end  
  end  
  
  private
  
  def destination_params
    params.require(:destination_shipping_address).permit(:zip_code, :prefecture_id, :city, :adress, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: destination_params[:token],
      currency: 'jpy'
    )
  end   
end
