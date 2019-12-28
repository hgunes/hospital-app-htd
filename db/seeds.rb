# frozen_string_literal: true

20.times do |doctor|
  Doctor.create!(
    first_name: 'Doctor',
    last_name: "#{doctor}",
    practicing_from: Time.now,
    qualification_number: doctor,
    employment: 0
  )
end

20.times do |patient|
  Patient.create!(
    first_name: "Patient",
    last_name: "#{patient}",
    age: patient + 20,
    gender: 1
  )
end