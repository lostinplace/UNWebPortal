class CreateLaws < ActiveRecord::Migration
  def change
    create_table :laws do |t|
      t.string :title
      t.text :description
      t.date :effective_on
      t.string :tags

      t.timestamps
    end
  end
end
