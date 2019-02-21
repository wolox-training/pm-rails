class Rent < ApplicationRecord
  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :user
  belongs_to :book

  after_create :send_email_to_owner, :schedule_end_email

  private

  def send_email_to_owner
    RentMailer.with(rent: self).new_rent_email.deliver_later
  end

  def schedule_end_email
    Sidekiq.set_schedule('rent_end_email_worker',
                         {
                             at: (end_date + 9.hours).in_time_zone("Buenos Aires"),
                             class: 'RentEndEmailWorker',
                             args: {rent_id: id}
                         })
  end
end
