class RentMailer < ApplicationMailer
  def new_rent_email
    @rent = params[:rent]
    @user = @rent.user
    @book = @rent.book

    mail(to: @user.email, subject: 'New Rent!')
  end

  def rent_end_email
    @rent = params[:rent]
    @user = @rent.user
    @book = @rent.book
  end
end
