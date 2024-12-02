class UpdateInssDiscountOfProponentsWorker
  include Sidekiq::Worker
  include ActionView::Helpers::NumberHelper

  sidekiq_options queue: 'default', retry: 3

  def perform(proponent_id)
    proponent = Proponent.find_by(id: proponent_id)
    return unless proponent

    inss_discount, group_discount = DiscountRate.calculate_discount(nil, 1, proponent.salary, 0.0)
    salary_with_discout = DiscountRate.clean_value(proponent.salary) - inss_discount
    salary_with_discout = number_to_currency(salary_with_discout, unit: "R$ ", separator: ",", delimiter: ".")
    inss_discount = number_to_currency(inss_discount, unit: "R$ ", separator: ",", delimiter: ".")

    proponent.update(salary: salary_with_discout, inss_discount: inss_discount, group_discount: group_discount)
  end
end
