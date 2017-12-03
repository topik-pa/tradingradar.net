class MessageMailer < ApplicationMailer
  
  default from: "noreply@tradingradar.net"
  default to: "marco@tradingradar.net"

  def new_message(message)
    @message = message
    
    mail subject: "Message from #{message.name}"
  end
    
end
