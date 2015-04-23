class TeamRegistration < ActiveRecord::Base
  validates :captain_name, presence: true
  validates :captain_email, presence: true, :email => {:strict_mode => true}
  validates :team_members, presence: true
end