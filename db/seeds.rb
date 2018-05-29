# Seeds for MedicalRecord

puts 'Creating medical records...'
  medical_record_1 = MedicalRecord.new(
    record_date: DateTime.new(2017,9,14,8),
    title: "record 1",
    category: "Compte Rendu",
    user_id: "1"
  )
  medical_record_1.save!

  medical_record_2 = MedicalRecord.new(
    record_date: DateTime.new(2017,10,14,8),
    title: "record 2",
    category: "Imagerie",
    user_id: "1"
  )
  medical_record_2.save!

  medical_record_3 = MedicalRecord.new(
    record_date: DateTime.new(2017,11,14,8),
    title: "record 3",
    category: "Prise de Sang",
    user_id: "1"
  )
  medical_record_3.save!

  medical_record_4 = MedicalRecord.new(
    record_date: DateTime.new(2017,12,14,8),
    title: "record 4",
    category: "Compte Rendu",
    user_id: "1"
  )
  medical_record_4.save!
puts 'Finished!'

