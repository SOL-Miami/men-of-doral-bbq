class AdvertistmentPackagesController < InheritedResources::Base

  private

    def advertistment_package_params
      params.require(:advertistment_package).permit(:company, :first_name, :last_name, :email, :phone, :package)
    end
end

