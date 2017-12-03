class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    
    if @message.valid?
      MessageMailer.new_message(@message).deliver_now
      redirect_to contact_path, notice: "Il messaggio è stato spedito."
    else
      flash[:alert] = "Si è verificato un errore : il messaggio non è stato spedito. Riprova più tardi"
      render :new
    end
  end

private

  def message_params
    params.require(:message).permit(:name, :email, :content)
  end

end