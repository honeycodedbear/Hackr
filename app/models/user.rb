class User < ActiveRecord::Base
  #attr_accessible :name, :location, :gender, :seeking, :school, :type


  #Login stuff begin
  has_secure_password
  #before_save :fix_names
  def fix_names
    self.name ||= "undefined username"
    self.email ||= "undefined email"
    self.name = self.name.downcase
    self.email = self.email.downcase
  end
  def self.isAnEmail?(input)
    input.include? "@"
  end

  def login(password)
    #easier to remember
    self.authenticate(password)
  end
  #Login stuff end

  #Questions
  #before_save :creep_scoreANDquestions

  def creep_scoreANDquestions
    self.creep_score ||= 0.0
    self.q1 ||= "?"
    self.q2 ||= "?"
    self.q3 ||= "?"
  end
  #Questions end

  has_many :likes, class_name: "Like", foreign_key: "userA_id"
  has_many :liked_bys, class_name: "Like", foreign_key: "userB_id"

  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address

  #qbefore_save :generateAddress

  def self.mutually_likes(userA, userB)
    if Like.where("userA_id = ? and userB_id = ?", userA.id, userB.id).empty? && Like.where("userA_id = ? and userB_id = ?", userB.id, userA.id).empty?
      false
    else
      true
    end
  end

  def findMutualLikes
    result = {}
    #IMPROVEMENTS this may be unscabable look into include?/flattened queries
    self.likes.each do |other|
      result[other] = !Like.where("userA_id = ? and userB_id = ?", other.userB_id, self.id).empty?
      puts other
    end
    result.select{|key, value| value == true}.keys.map {|like| User.find(like.userB_id)}
  end

  def myLocalMatches(distance=5)
      User.near([self.latitude,self.longitude], distance).where(gender: self.seeking)
  end

  def randomMatch
    myLocalMatches.sample(1)
  end

  def generateAddress
    #NEED TO FIND A WAY TO CHECK TO MAKE SURE THIS IS NECESSARY
    self.location ||= '10007'
    latlon = self.location.to_latlon.split(",")
    self.latitude = latlon[0]
    self.longitude =latlon[1]
  end

  def getAge
    today = Time.zone.now
    ((today.year*12 + today.month) - (self.birthday.year*12+self.birthday.month))/12
  end
end
