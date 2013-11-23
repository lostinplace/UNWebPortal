class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.date :established_on
      t.string :political_system

      t.timestamps
    end
  end
end
