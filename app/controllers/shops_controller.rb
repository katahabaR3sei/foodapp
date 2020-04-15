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

  def index
    @shops = Shop.all.order(id: "asc")
    end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if shop.user_id == current_user.id
      @shop.update(shop_params)
      redirect_to shop_path(@shop), notice:"編集が完了しました！"
    else
      flash[:alert] = "権限がありません！"
      render :show
    end  
  end

  def destroy
    shop = Shop.find(params[:id])
    if shop.user_id == current_user.id
      shop.destroy
      redirect_to shops_path, notice:"削除されました！"
    else
      flash[:alert] = "権限がありません！"
      render :show
    end
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :image, :title, :description, :genre_id, :pricerange_id, :address_id)
  end
end
