json.array!(@team_registrations) do |team_registration|
  json.extract! team_registration, :id, :team_name, :captain_name, :captain_email, :team_members
  json.url team_registration_url(team_registration, format: :json)
end
