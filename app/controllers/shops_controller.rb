class ShopsController < ApplicationController
  def new
    @shop = Shop.new
    @shop.build_genre
  end

  def create
    @shop = current_user.shops.new(shop_params)
    if @shop.save
      flash[:success] = "投稿ありがとうございます！"
      redirect_to shops_path
    else
      flash[:danger] = "投稿失敗・・・"
      render :new
    end
  end

   def index
    @shops = Shop.all
   end

  private
  def shop_params
    params.require(:shop).permit(:name,:descriptioin,:image,:title,:description,genre_attributes:[:id,:name])
  end
end
