class TweetsController < ApplicationController
  
  def index
    @tweets=Tweet.all
  end
  
  def new
    @tweet=Tweet.new
  end
  
  def create
    @tweet=Tweet.new(tweet_params)
    @tweet.save
  end
  
  def show
    @tweet=Tweet.find_by(id: params[:id])
  end
  
  def edit
    @tweet=Tweet.find_by(id: params[:id])
  end
  
  def update
    @tweet=Tweet.find_by(id: params[:id])
    @tweet.update(tweet_params)
    @tweet.save
  end
  
  def destroy
    @tweet=Tweet.find_by(id: params[:id])
    @tweet.destroy
  end
  
  private
  def tweet_params
    params.require(:tweet).permit(:name, :description, :picture)
  end
  
end
