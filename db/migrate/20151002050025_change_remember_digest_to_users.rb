class ChangeRememberDigestToUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :remember_token, :remember_digest
  end
end
