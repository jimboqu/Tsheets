class Client < ActiveRecord::Base
	belongs_to :user
	has_many :jobs, dependent: :destroy
	has_many :blocks, through: :jobs
	accepts_nested_attributes_for :jobs, reject_if: proc {|attributes| attributes['story'].blank?}
end