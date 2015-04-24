class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
end
