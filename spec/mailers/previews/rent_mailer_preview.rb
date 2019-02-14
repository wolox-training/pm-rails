# Preview all emails at http://localhost:3000/rails/mailers/rent_mailer
class RentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/rent_mailer/new_rent_email
  def new_rent_email
    RentMailer.new_rent_email
  end

end
