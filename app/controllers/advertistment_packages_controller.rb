class AdvertistmentPackagesController < InheritedResources::Base
  attr_accessor :stripeToken

  def create
    @advertisment_package = AdvertistmentPackage.new(advertistment_package_params)
    respond_to do |format|
      if @advertisment_package.save
        format.html { redirect_to page_path('thank_you') }
        format.json { render action: 'show', status: :created, location: @advertisment_package }
        format.js   { render :nothing => true, status: :created, location: @advertisment_package }
      else
        format.html { render action: 'new' }
        format.json { render json: @advertisment_package.errors, status: :unprocessable_entity }
        format.js   { render json: @advertisment_package.errors, status: :unprocessable_entity }
      end
    end

    Stripe.api_key = ENV["stripe_secret_key"]
    token = params[:stripeToken]
    email = params['advertistment_package']['email']
    begin
      charge = Stripe::Charge.create(
        :amount => params['advertistment_package']['package'],
        :currency => "usd",
        :card => token,
        :description => "Advertistment Package",
        :receipt_email => email
      )
    rescue Stripe::CardError => e
      # The card has been declined
    end
  end

  private

    def advertistment_package_params
      params.require(:advertistment_package).permit(:company, :first_name, :last_name, :email, :phone, :package)
    end
end

