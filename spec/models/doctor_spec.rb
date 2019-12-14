# frozen_string_literal: true

require 'rails_helper'

describe Doctor do
  context 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:practicing_from) }
    it { is_expected.to validate_presence_of(:qualification_number) }
    it { is_expected.to validate_presence_of(:employment) }
  end

  context 'uniqueness' do
    before { FactoryBot.create(:doctor) }

    it { is_expected.to validate_uniqueness_of(:qualification_number) }
  end

  context 'relations' do
    it { is_expected.to have_many(:patients) }
  end

  context 'enumerators' do
    it { is_expected.to define_enum_for(:employment).with_values(%w[full_time part_time intern contract]) }
  end
end
