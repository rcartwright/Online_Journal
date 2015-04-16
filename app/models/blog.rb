class Blog < ActiveRecord::Base

	extend FriendlyId
  	friendly_id :blog_name, use: [:slugged, :finders]

	has_many :posts, :dependent => :destroy
	has_one :user, :dependent => :destroy
	accepts_nested_attributes_for :user
end
