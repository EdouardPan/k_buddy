# Seeds for MedicalRecord

puts 'Creating medical records...'
  medical_record_1 = MedicalRecord.new(
    record_date: DateTime.new(2017,9,14,8),
    title: "record 1",
    category: "Compte Rendu",
    user_id: "1"
  )
  medical_record_1.save!
puts 'Finished!'

