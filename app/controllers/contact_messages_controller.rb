class ContactMessagesController < ApplicationController
  def new
    @contact_message = ContactMessage.new
  end

  def create
    @contact_message = ContactMessage.new(contact_message_params)

    respond_to do |format|
      if @contact_message.save
        @contact_message.send_email
        format.html { redirect_to "/", notice: 'Your message has been successfully sent!' }
      else
        flash[:alert] = "Could not send your message!"
        Honeybadger.notify("Contact Message could not be sent!\n#{name}\n#{email}\n#{message}" + contact_message.errors.full_messages.join(" | "))
        format.html { render :new }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def contact_message_params
      params.require(:contact_message).permit(:name, :email, :message)
    end
end
