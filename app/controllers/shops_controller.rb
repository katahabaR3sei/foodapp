class ShopsController < ApplicationController
  def new
    @shop = Shop.new
  end

  def create
    @shop = current_user.shops.new(shop_params)
    if @shop.save
      redirect_to shops_path, notice:"投稿ありがとうございます！"
    else
      flash[:alert] = "投稿失敗・・・"
      render :new
    end
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params)
    redirect_to shop_path(@shop)
  end

  def index
  @shops = Shop.all.order(id: "asc")
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :image, :title, :description, :genre_id, :pricerange_id, :address_id)
  end
end
