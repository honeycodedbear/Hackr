class Message < ActiveRecord::Base

  def self.getConversation( user1, user2)
    x = Message.where(userA_id: user1.id, userB_id: user2.id)
    y = Message.where(userA_id: user2.id, userB_id: user1.id)
    (x+y).sort_by {|hash| hash[:updated_at]}
  end
end
