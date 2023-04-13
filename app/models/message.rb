class Message < ApplicationRecord
  belongs_to :user
  validates_presence_of :content
  after_create_commit {broadcast_message}

  private
  def broadcast_message
    ActionCable.server.broadcast("MessagesChannel",{
      id:,
      content:
    })
  end
end
