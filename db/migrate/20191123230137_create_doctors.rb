# frozen_string_literal: true

class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :practicing_from, null: false
      t.integer :qualification_number, null: false
      t.integer :employment, null: false, default: 0

      t.timestamps
    end

    add_index :doctors, :qualification_number, unique: true
  end
end
