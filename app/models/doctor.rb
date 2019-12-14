# frozen_string_literal: true

class Doctor < ApplicationRecord
  validates :first_name, :last_name, :practicing_from, :qualification_number, :employment, presence: true
  validates :qualification_number, uniqueness: true

  has_many :patients

  enum employment: {
    'Full time': 0,
    'Part time': 1,
    'Intern': 2,
    'Contract': 3
  }
  end
