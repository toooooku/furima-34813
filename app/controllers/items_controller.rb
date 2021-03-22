class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end  
  end

  def show
    @item = Item.find(params[:id])
  end  

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
  end  

  def update
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end    
  end  
  
  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :category_id, :status_id, :cost_id, :day_id, :prefecture_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

