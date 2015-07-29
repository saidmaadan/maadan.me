class Developer < ActiveRecord::Base
  has_secure_password

  extend FriendlyId
  friendly_id :username, use: :slugged
  
  validates :password, length: { minimum: 8, allow_blank: true }

  validates :name, presence: true
  validates :email, presence: true,
                  format: /\A\S+@\S+\z/,
                  uniqueness: { case_sensitive: false }

  validates :username, presence: true,
                     format: /\A[A-Z0-9]+\z/i,
                     uniqueness: { case_sensitive: false }

  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end

  def self.authenticate(email_or_username, password)
    developer = Developer.find_by(email: email_or_username) || Developer.find_by(username: email_or_username)
    developer && developer.authenticate(password)
  end
end
