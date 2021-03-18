class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @items = Item.new
  end
  
  #def create
    #@item = Item.new(item_params)
    #if @item.save
      #redirect_to root_path
    #else
      #render :new
    #end  
  #end
  
  #private

  #def item_params
    #params.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day])
  #end

end

