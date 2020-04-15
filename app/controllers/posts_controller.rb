class PostsController < ApplicationController
  def new
    @shop = Shop.find(params[:shop_id])
    @post = @shop.posts.new
    @user = current_user
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @post = @shop.posts.new(post_params)
    if @post.save
      redirect_to shop_path(@shop), notice:"投稿ありがとうございます！"
    else
      flash[alert] = "投稿失敗・・・"
      redirect_to new_shop_post_path(@shop)
    end
  end

  def edit
    @shop = Shop.find(params[:id])
    @post = @shop.posts.find(params[:shop_id])
    @user = current_user
  end

  def update
    @shop = Shop.find(params[:shop_id])
    @post = @shop.posts.find(params[:id])
    if @post.user_id == current_user.id
      @post.update(post_params)
      redirect_to shop_path(@shop), notice:"クチコミを編集しました!"
    else
      flash[:alert] = "権限がありません！"
      render :show
    end  
  end

  def destroy
    shop = Shop.find(params[:id])
    post = shop.posts.find(params[:shop_id])
    if post.user_id == current_user.id
      post.destroy
      redirect_to shop_path(shop), notice:"クチコミを削除しました!"
    else  
      flash[:alert] = "権限がありません！"
      render :show
    end   
  end
  

  private
  def post_params
    params.require(:post).permit(:title, :taste, :atmosphere, :service, :shop_id, :user_id, :rate)
  end
end
