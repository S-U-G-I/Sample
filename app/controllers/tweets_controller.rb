class TweetsController < ApplicationController
   before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @tweets=Tweet.all
  end
  
  def new
    @tweet=Tweet.new
  end
  
  def show
    @tweet=Tweet.find_by(id: params[:id])
    @comments=@tweet.comments
    @comment=Comment.new
  end
   
  def create
    @tweet=current_user.tweets.new(tweet_params)
    @tweet.save
    flash[:notice] = "投稿しました"
    redirect_to root_path
  end
  
  
  def edit
    @tweet=Tweet.find_by(id: params[:id])
  end
  
  def update
    @tweet=Tweet.find_by(id: params[:id])
    @tweet.update(tweet_params)
    
    if @tweet.save
    flash[:notice] = "編集しました"
    redirect_to root_path
    else
      flash[:alert]="画像投稿は必須です。"
    redirect_to new_tweet_path
    end
    
  end
  
  def destroy
    @tweet=Tweet.find_by(id: params[:id])
    @tweet.destroy
    flash[:notice] = "削除しました"
    redirect_to root_path
  end
  
  private
  def tweet_params
    params.require(:tweet).permit(:description, :picture, :user_id)
  end
  
end