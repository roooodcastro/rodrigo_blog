class CreateBlogComments < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_comments do |t|
      t.text :body
      t.integer :commentable_id
      t.string :commentable_type
      t.integer :user_id
      t.timestamps
    end
  end
end
