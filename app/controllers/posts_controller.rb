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
      redirect_to shop_path, notice:"投稿ありがとうございます！"
    else
      flash[alert] = "投稿失敗・・・"
      render new_post_path(@post)
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :shop_id, :user_id)
  end
end
