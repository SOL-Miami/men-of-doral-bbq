class AdvertistmentPackage < ActiveRecord::Base
  PACKAGES = {"Platinum/Under": Rails.application.secrets.stripe["platinum_package"], 
              "Gold": Rails.application.secrets.stripe["gold_package"],
              "Silver": Rails.application.secrets.stripe["silver_package"]
             }
end
