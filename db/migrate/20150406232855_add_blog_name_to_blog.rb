class AddBlogNameToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :blog_name, :string
  end
end
