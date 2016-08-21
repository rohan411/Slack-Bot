# Model for storing user details
#
# rohan.jha

class User < ActiveRecord::Base

  validates_uniqueness_of :email_id

  has_one :learning_configuration, dependent: :destroy
  has_many :topics, dependent: :destroy

  after_create :set_config

  def set_config
    LearningConfigurationService.new(self).create
  end

end