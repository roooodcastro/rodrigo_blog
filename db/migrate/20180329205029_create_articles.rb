class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :summary
      t.text :content
      t.references :author

      t.datetime :published_at
      t.timestamps
    end

    add_foreign_key :articles, :users, column: :author_id
  end
end
