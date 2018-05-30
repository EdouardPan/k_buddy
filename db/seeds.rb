# Seeds for MedicalRecord

puts 'Creating medical records...'
  medical_record_1 = MedicalRecord.new(
    record_date: DateTime.new(2012,9,14,8),
    title: "Pneumothorax",
    category: "Opération",
    user_id: "1"
  )
  medical_record_1.save!

  medical_record_2 = MedicalRecord.new(
    record_date: DateTime.new(2009,10,14,8),
    title: "Eczéma",
    category: "Antécédent Familial",
    user_id: "1"
  )
  medical_record_2.save!

  medical_record_3 = MedicalRecord.new(
    record_date: DateTime.new(2012,11,14,8),
    title: "Examen Prise de Sang 2012",
    category: "Prise de Sang",
    user_id: "1"
  )
  medical_record_3.save!

  medical_record_4 = MedicalRecord.new(
    record_date: DateTime.new(2010,12,14,8),
    title: "Consultation ORL",
    category: "Autre",
    user_id: "1"
  )
  medical_record_4.save!
puts 'Finished!'

# Seeds for MedicalRecord


# Seeds for MedicalRecord
