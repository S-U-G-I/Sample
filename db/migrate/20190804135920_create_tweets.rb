class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :name
      t.text :description
      t.text :picture
      t.timestamps
    end
  end
end
