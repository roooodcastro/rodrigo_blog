class CreateBlogArticleTags < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_article_tags do |t|
      t.references :article, null: false
      t.references :tag, null: false

      t.timestamps
    end

    add_foreign_key :blog_article_tags, :blog_articles, column: :article_id
    add_foreign_key :blog_article_tags, :blog_tags, column: :tag_id
  end
end
