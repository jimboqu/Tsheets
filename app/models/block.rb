
class Block < ActiveRecord::Base
  belongs_to :user
  belongs_to :job
  after_create :live_act
  validates_presence_of :job_id
  validates_presence_of :time

  def live_act
  	update_attribute(:live, true)
  end
end