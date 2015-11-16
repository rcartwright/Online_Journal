class AddAboutToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :about, :text
  end
end
