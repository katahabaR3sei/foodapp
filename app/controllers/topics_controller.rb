class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)
    if @topic.save
      flash[:success] = "投稿ありがとうございます！"
      redirect_to topics_path
    else
      flash[:danger] = "投稿失敗・・・"
      render :new
    end
  end

   def index
    @topics = Topic.all
   end

  private
  def topic_params
    params.require(:topic).permit(:store_name,:descriptioin,:image,:title,:genre,:description)
  end
end
