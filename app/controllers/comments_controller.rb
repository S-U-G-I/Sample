class CommentsController < ApplicationController

def create
  @tweet=Tweet.find_by(id: params[:tweet_id])
  @comment=Comment.new(comment_params)
  @comment.user_id=current_user.id
  @comment.tweet=@tweet 
  if @comment.save
    flash[:notice] = "投稿しました"
  else
    Rails.logger.error @comment.errors.full_messages.join('')
    flash[:alert] = "投稿できませんでした"
  end
  redirect_to tweet_path(@tweet), method: :get
end

def reply
  @tweet=Tweet.find_by(id: params[:tweet_id])
  @comment=@tweet.comments
  @reply=@comment.new(comment_params)
  
  @reply.user_id=current_user.id
  @reply.tweet=@tweet
  @reply.reply_id=@tweet
  
   if @reply.save
    flash[:notice]= "コメントしました"
   else
    flash[:alert]="コメント出来ませんでした。"
   end
  redirect_to tweet_path(@tweet), method: :get
end

def destroy
  @tweet=Tweet.find_by(id: params[:tweet_id])
  @comment=Comment.find_by(id: params[:tweet_id])
  @comment.destroy
  flash[:notice] = "削除しました"
  redirect_to controller: "tweets", action: "show"
end

private
  def comment_params
    params.require(:comment).permit(:user_id, :tweet_id, :text, :reply_id)
  end
  
end