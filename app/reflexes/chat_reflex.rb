class ChatReflex < ApplicationReflex
  def send(content)
    sender = current_user
    receiver = User.find(element.dataset["user-id"])
    ChatMessage.create(sender: sender, receiver: receiver, content: content)
  end
end
