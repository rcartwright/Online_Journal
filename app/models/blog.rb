class Blog < ActiveRecord::Base

	extend FriendlyId
  	friendly_id :blog_name, use: [:slugged, :finders]

	has_many :posts,-> { order "created_at DESC" }, dependent: :destroy
	has_one :user, :dependent => :destroy
	has_one :style, :dependent => :destroy
	accepts_nested_attributes_for :user
	validates_associated :user
end
