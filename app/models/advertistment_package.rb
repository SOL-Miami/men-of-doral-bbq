class AdvertistmentPackage < ActiveRecord::Base
  PACKAGES = {"Platinum/Under": ENV["stripe_platinum_package"], 
              "Gold": ENV["stripe_gold_package"],
              "Silver": ENV["stripe_silver_package"]
             }
             
  validates :company, presence: true          
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, :email => {:strict_mode => true} 
  validates :phone, presence: true
  validates :package, presence: true   
end