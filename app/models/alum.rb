class Alum < ActiveRecord::Base
  validates :username, :password_digest, :email, presence:true
  validates :username, :email, uniqueness: true
  validate :invalid_email
  validate :password_length
  validate :too_long

  attr_reader :password



  def self.new_sessin_token
    SecureRandom.urlsafe_base64(16)
  end

  def password=(password)
    @password = password
    self.password_digest=BCrypt::Password.create(password)
  end



  private

  def password_length
    if !(@password.nil? || @password.length > 4)
      self.errors.messages[:password_length]=["needs to be over 5 characters"]
    end
  end

  def invalid_email
    if !(self.email=~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)
      self.errors.messages[:invalid_email]=["needs to be in proper format"]
    end
  end

  def too_long
    #make sure nothing is over 140 chars
    self.attributes.keys.each do |key|
      next if key = "password_digest"
      if self.send(key).to_s.length >35
        self.errors.messages[key.to_sym] = ["keyboard banging?"]
      end
    end
  end


end
