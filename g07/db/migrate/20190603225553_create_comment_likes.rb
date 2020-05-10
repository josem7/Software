class CreateCommentLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_likes do |t|
      t.integer :uid
      t.integer :cid
      t.integer :tipo

      t.timestamps
    end
  end
end
