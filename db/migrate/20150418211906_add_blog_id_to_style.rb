class AddBlogIdToStyle < ActiveRecord::Migration
  def change
    add_column :styles, :blog_id, :integer
  end
end
