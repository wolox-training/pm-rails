class RentEndEmailWorker < ApplicationJob
  def perform(rent_id)
    rent = Rent.find(rent_id)
    RentMailer.with(rent: rent).rent_end_email.deliver_later
  rescue ActiveRecord::RecordNotFound
    # Do something when the rent does not exist
  end
end
