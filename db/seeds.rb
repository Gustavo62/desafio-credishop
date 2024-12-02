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

DiscountRate.create!(position: 1, min: "R$ 0,00", max: "R$ 1045,00", discount: "7,5%")
DiscountRate.create!(position: 2, min: "R$ 1045,01", max: "R$ 2089,60", discount: "9%")
DiscountRate.create!(position: 3, min: "R$ 2089,61", max: "R$ 3134,40", discount: "12%")
DiscountRate.create!(position: 4, min: "R$ 3134,41", max: "R$ 6101,06", discount: "14%")