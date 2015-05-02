class AdvertistmentPackagesController < InheritedResources::Base
  attr_accessor :stripeToken

  def create
    @advertisment_package = AdvertistmentPackage.new(advertistment_package_params)
    respond_to do |format|
      if @advertisment_package.save
        format.html { redirect_to page_path('thank_you') }
        format.json { render action: 'show', status: :created, location: @advertisment_package }
        format.js   { render :nothing => true, status: :created, location: @advertisment_package }
        ContactMailer.advertisment_package_email(@advertisment_package).deliver_now
      else
        format.html { render action: 'new' }
        format.json { render json: @advertisment_package.errors, status: :unprocessable_entity }
        format.js   { render json: @advertisment_package.errors, status: :unprocessable_entity }
      end
    end

    package = params['advertistment_package']['package']
    
    if package == "platinum"
      amount = ENV["stripe_platinum_package"]
    elsif package == "gold"
      amount = ENV["stripe_gold_package"]
    elsif package == "silver"
      amount = ENV["stripe_silver_package"]
    end

    Stripe.api_key = ENV["stripe_secret_key"]
    token = params[:stripeToken]
    email = params['advertistment_package']['email']
    begin
      charge = Stripe::Charge.create(
        :amount => amount,
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

