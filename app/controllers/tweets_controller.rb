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
  
  private
  def tweet_params
    params.require(:tweet).permit(:name, :description, :picture)
  end
  
end
