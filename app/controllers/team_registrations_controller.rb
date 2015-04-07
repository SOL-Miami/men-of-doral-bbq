class TeamRegistrationsController < InheritedResources::Base

  private

    def team_registration_params
      params.require(:team_registration).permit(:team_name, :captain_name, :captain_email, :team_members)
    end
end

