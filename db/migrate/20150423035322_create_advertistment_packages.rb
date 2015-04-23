class CreateAdvertistmentPackages < ActiveRecord::Migration
  def change
    create_table :advertistment_packages do |t|
      t.string :company
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :package

      t.timestamps null: false
    end
  end
end
