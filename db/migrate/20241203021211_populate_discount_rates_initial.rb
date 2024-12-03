class PopulateDiscountRatesInitial < ActiveRecord::Migration[7.2]
  def change
    DiscountRate.create!(position: 1, min: "R$ 0,00", max: "R$ 1045,00", discount: "7,5%")
    DiscountRate.create!(position: 2, min: "R$ 1045,01", max: "R$ 2089,60", discount: "9%")
    DiscountRate.create!(position: 3, min: "R$ 2089,61", max: "R$ 3134,40", discount: "12%")
    DiscountRate.create!(position: 4, min: "R$ 3134,41", max: "R$ 6101,06", discount: "14%")
  end
end
