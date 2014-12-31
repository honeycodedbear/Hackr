class User < ActiveRecord::Base
  #attr_accessible :name, :location, :gender, :seeking, :school, :type
  has_many :likes, class_name: "Like", foreign_key: "userA_id"
  has_many :liked_bys, class_name: "Like", foreign_key: "userB_id"
  def self.mutually_likes(userA, userB)
    if Like.where("userA_id = ? and userB_id = ?", userA.id, userB.id).empty? && Like.where("userA_id = ? and userB_id = ?", userB.id, userA.id).empty?
      false
    else
      true
    end
  end

  def findMutualLikes
    result = {}
    self.likes.each do |other|
      result[other] = !Like.where("userA_id = ? and userB_id = ?", other.id, self.id).empty?
    end
    puts result
    result.select{|key, value| value == true}
  end
end
