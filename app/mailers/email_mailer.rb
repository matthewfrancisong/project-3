class EmailMailer < ApplicationMailer
  # default :from => admin.email

    def send_all_guest_email(guest, message, admin)

      @admin = admin
      @guest = guest
      @message = message
      mail(
        from: @admin.email,
        to: @guest.email,
        subject: "You're Invited! #{@admin.title}wedding on #{@admin.date.to_formatted_s(:long)}"
      )
    end
end
