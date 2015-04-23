class Newsletter < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, :email => {:strict_mode => true}
end
