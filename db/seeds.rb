10.times do
  salary = Faker::Number.between(from: 300, to: 9999).to_f
  formatted_salary = "R$ #{'%.2f' % salary}".gsub('.', ',')

  Proponent.create!(
    name: Faker::Name.name,
    cpf: Faker::CPF.cpf,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
    salary: formatted_salary
  )
end
