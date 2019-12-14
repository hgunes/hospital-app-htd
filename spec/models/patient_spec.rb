# frozen_string_literal: true

require 'rails_helper'

describe Patient do
  context 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :age }
    it { is_expected.to validate_presence_of :gender }
  end

  context 'relations' do
    it { is_expected.to belong_to(:doctor).optional }
  end

  context 'enumerators' do
    it { is_expected.to define_enum_for(:gender).with_values(%w[male female other]) }
  end
end
