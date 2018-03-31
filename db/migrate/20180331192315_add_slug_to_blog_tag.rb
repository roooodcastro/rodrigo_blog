class AddSlugToBlogTag < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_tags, :slug, :string
  end
end
