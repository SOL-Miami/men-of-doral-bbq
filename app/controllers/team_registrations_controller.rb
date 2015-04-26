class TeamRegistrationsController < InheritedResources::Base
  attr_accessor :stripeToken

  def create
    @team_registration = TeamRegistration.new(team_registration_params)
    respond_to do |format|
      if @team_registration.save
        format.html { redirect_to page_path('thank_you') }
        format.json { render action: 'show', status: :created, location: @team_registration }
        format.js   { render :nothing => true, status: :created, location: @team_registration }
      else
        format.html { render action: 'new' }
        format.json { render json: @team_registration.errors, status: :unprocessable_entity }
        format.js   { render json: @team_registration.errors, status: :unprocessable_entity }
      end
    end

    Stripe.api_key = ENV["stripe_secret_key"]
    token = params[:stripeToken]
    email = params['team_registration']['captain_email']
    begin
      charge = Stripe::Charge.create(
        :amount => ENV["stripe_registration_price"],
        :currency => "usd",
        :card => token,
        :description => "Team Registration",
        :receipt_email => email
      )
    rescue Stripe::CardError => e
      # The card has been declined
    end
  end

  private

    def team_registration_params
      params.require(:team_registration).permit(:team_name, :captain_name, :captain_email, :team_members, :stripeToken)
    end
end
