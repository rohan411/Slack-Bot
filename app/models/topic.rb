# Model for storing the topics learnt by a user
#
# rohan.jha

class Topic < ActiveRecord::Base

  belongs_to :user
  before_create :set_defaults
  after_create :schedule_assessment

  private

  def set_defaults
    self.status ||= LearningStatus::NEW
  end

  def schedule_assessment
    AssessmentService.new(self).schedule
  end

end