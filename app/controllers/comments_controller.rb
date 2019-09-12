class CommentsController < ApplicationController

def create
  @tweet=Tweet.find_by(id: params[:tweet_id])
  @comment=Comment.new(comment_params)
  @comment.user_id=current_user.id
  @comment.tweet=@tweet # @tweet ではなく、 @tweet.id ? 
  if @comment.save # save は true/false で失敗を返すので、エラーは表示する
    flash[:notice] = "投稿しました"
  else
    Rails.logger.error @comment.errors.full_messages.join('')
    flash[:alert] = "投稿できませんでした"
  end
  redirect_to root_path
end

private
  def comment_params
    params.require(:comment).permit(:user_id, :tweet_id, :text)
  end
  
end
