class AddBlogIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :blog_id, :integer
  end
end
