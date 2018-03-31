class RenameArticlesTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :articles, :blog_articles
  end
end
