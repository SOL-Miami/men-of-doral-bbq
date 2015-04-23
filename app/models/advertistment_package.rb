class AdvertistmentPackage < ActiveRecord::Base
  PACKAGES = {"Platinum/Under": ENV["stripe_platinum_package"], 
              "Gold": ENV["stripe_gold_package"],
              "Silver": ENV["stripe_silver_package"]
             }
end
