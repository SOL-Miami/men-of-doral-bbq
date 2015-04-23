class TeamRegistration < ActiveRecord::Base
  PACKAGES = {"Platinum/Under": Rails.application.secrets.stripe["registration_price"], 
              "Gold": Rails.application.secrets.stripe["registration_price"],
              "Silver":Rails.application.secrets.stripe["registration_price"]
             }
end
