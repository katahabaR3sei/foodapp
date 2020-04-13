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

  private
  def post_params
    params.require(:post).permit(:title, :description, :shop_id, :user_id, :rate)
  end
end
