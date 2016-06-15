
class Block < ActiveRecord::Base
  belongs_to :user
  belongs_to :job
  validates_presence_of :job_id
  validates_presence_of :time
end