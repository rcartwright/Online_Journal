class Blog < ActiveRecord::Base
	has_many :posts, :dependent => :destroy
	has_one :user, :dependent => :destroy
end
