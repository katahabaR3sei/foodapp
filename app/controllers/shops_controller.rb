class ShopsController < ApplicationController
  def new
    @shop = Shop.new
  end

  def create
    @shop = current_user.shops.new(shop_params)
    if @topic.save
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
    params.require(:shop).permit(:name,:descriptioin,:image,:title,:description)
  end
end
