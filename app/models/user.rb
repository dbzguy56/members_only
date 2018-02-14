class User < ApplicationRecord
  attr_accessor :remember_token
  before_create :remember_user
  has_secure_password
  has_many :posts

  #Creates and assigns the activation token and digest
  def remember_user
    self.remember_token = Digest::SHA1.hexdigest( SecureRandom.urlsafe_base64.to_s)
  end
end
