class RemoveBlogNameFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :blog_name, :string
  end
end
