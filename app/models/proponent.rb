class Proponent < ApplicationRecord
  after_create_commit :enqueue_update_inss_job

  has_many :addresses, inverse_of: :proponent, dependent: :destroy
  has_many :contacts, inverse_of: :proponent, dependent: :destroy
  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :contacts, reject_if: :all_blank, allow_destroy: true

  private

  def enqueue_update_inss_job
    UpdateInssDiscountOfProponentsWorker.perform_async(id)
  end
end
