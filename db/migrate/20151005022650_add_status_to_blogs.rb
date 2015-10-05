class AddStatusToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :status, :string
  end
end
