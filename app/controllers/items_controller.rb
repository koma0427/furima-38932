class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :move_to_index, except: [:index, :show]
  def index
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

  private

  def item_params
    params.require(:item).permit(:image,:name,:product_description,:category_id,:status_id,:delivery_burden_id,:prefecture_id,:delivery_time_id,:selling_price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  end
  
