class CreateTeamRegistrations < ActiveRecord::Migration
  def change
    create_table :team_registrations do |t|
      t.string :team_name
      t.string :captain_name
      t.string :captain_email
      t.integer :team_members

      t.timestamps null: false
    end
  end
end
