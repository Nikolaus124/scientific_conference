class MemberMailer < ApplicationMailer
    default from: ENV['SENDER_EMAIL']
    
    def welcome_email(member)
        mail(to: member[:email], subject: "You got a new order!")
    end
end
