class Rent < ApplicationRecord
  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :user
  belongs_to :book

  after_create :send_email_to_owner

  private

  def send_email_to_owner
    RentMailer.with(rent: self).new_rent_email.deliver_later
  end
end
