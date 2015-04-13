class RemoveUserIdFromBlogs < ActiveRecord::Migration
  def change
    remove_column :blogs, :user_id, :integer
  end
end
