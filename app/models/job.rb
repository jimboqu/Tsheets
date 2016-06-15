class Job < ActiveRecord::Base
  belongs_to :client
  belongs_to :user
  has_many :blocks, dependent: :destroy
  validates_presence_of :client_id
end
