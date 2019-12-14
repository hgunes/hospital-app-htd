# frozen_string_literal: true

class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :age, null: false
      t.integer :gender, null: false

      t.timestamps
    end
  end
end
