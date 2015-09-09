class Post < ActiveRecord::Base
	belongs_to :blog
	belongs_to :user
	has_many :comments, :dependent => :destroy



scope :by_month, lambda { |month| where("strftime('%m', created_at) = ?", month) }
scope :by_year_and_month, ->(month, year) {
	where("strftime('%m', created_at) = ? AND strftime('%Y', created_at) = ?", month, year)
}
end
