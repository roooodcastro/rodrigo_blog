class RenameBlogTables < ActiveRecord::Migration[5.2]
  def change
    rename_table :blog_articles, :articles
    rename_table :blog_article_tags, :article_tags
    rename_table :blog_comments, :comments
    rename_table :blog_tags, :tags
  end
end
