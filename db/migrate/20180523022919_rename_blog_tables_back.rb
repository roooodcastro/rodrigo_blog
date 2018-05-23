class RenameBlogTablesBack < ActiveRecord::Migration[5.2]
  def change
    # I guess I shouldn't change my mind this often, but who cares
    rename_table :articles, :blog_articles
    rename_table :article_tags, :blog_article_tags
    rename_table :comments, :blog_comments
    rename_table :tags, :blog_tags
  end
end
