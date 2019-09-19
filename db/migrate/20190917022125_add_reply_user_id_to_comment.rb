class AddReplyUserIdToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :reply_id, :int
  end
end
