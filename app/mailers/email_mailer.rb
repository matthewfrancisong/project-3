class EmailMailer < ApplicationMailer
  default :from => 'matthewfoys@gmail.com'

    def send_all_guest_email(guest, message, admin)
      @guest = guest
      @message = message
      @admin = admin
      mail( :to => @guest.email,
      :subject => @admin.title
    end
end
