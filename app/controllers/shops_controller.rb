class ShopsController < ApplicationController
  def new
    @shop = Shop.new
  end

  def create
    @shop = current_user.shops.new(shop_params)
    if @shop.save
      redirect_to shops_path, notice: "投稿ありがとうございます！"
    else
      flash.now[:alert] = "投稿失敗・・・"
      render :new
    end
  end

  def index
    @shops = Shop.find(Post.group(:shop_id).order("avg(rate) desc").limit(5).pluck(:shop_id))
    @rate = Post.group(:shop_id).average(:rate)
  end

  def show
    @shop = Shop.find(params[:id])
    @posts = @shop.posts.page(params[:page]).per(3)
    @rate = Post.group(:shop_id).average(:rate)
    @count = Post.group(:shop_id).count(:rate)
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.user_id == current_user.id
      @shop.update(shop_params)
      redirect_to shop_path(@shop), notice: "編集が完了しました！"
    else
      flash[:alert] = "権限がありません！"
      render :show
    end
  end

  def destroy
    shop = Shop.find(params[:id])
    if shop.user_id == current_user.id
      shop.destroy
      redirect_to shops_path, notice: "削除されました！"
    else
      flash[:alert] = "権限がありません！"
      render :show
    end
  end

  def search
    shop_params = [params[:name], params[:genre_id], params[:pricerange_id], params[:address_id]]
    @shops = Shop.search(shop_params).page(params[:page]).per(3)
    @rate = Post.group(:shop_id).average(:rate)
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :image, :title, :description, :genre_id, :pricerange_id, :address_id)
  end
end
