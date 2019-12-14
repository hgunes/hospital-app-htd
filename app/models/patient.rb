# frozen_string_literal: true

class Patient < ApplicationRecord
  validates :first_name, :last_name, :age, :gender, presence: true

  belongs_to :doctor, optional: true

  enum gender: {
    male: 0,
    female: 1,
    other: 2
  }
  end
