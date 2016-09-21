require 'digest/sha1'
class User < ApplicationRecord
  has_secure_password

  after_validation            :generate_password, :on => :create
  before_update               :encrypt_password

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.authenticate(login_or_email, password)
    u = where("login = ? OR email = ?", login_or_email, login_or_email).first
    u && u.authenticated?(password) ? u : nil
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated?(password)
    password_digest == encrypt(password)
  end

  def generate_password
  	self.salt = Digest::SHA1.hexdigest("--#{Time.current.to_s}--#{login}--") if new_record?
  	self.password_digest = encrypt(password)
  end

  def encrypt_password
    return if password.blank?
    self.salt = Digest::SHA1.hexdigest("--#{Time.current.to_s}--#{login}--") if new_record?
    self.password_digest = encrypt(password)
  end

  def password_required?
    password_digest.blank? || password.present?
  end

  def customer_list
    Customer.order(:shop_name).all.map{|c| ["#{c.shop_name}, #{c.city}", c.id]}
  end

  def vendor_list
    Vendor.order(:company_name).all.map{|c| ["#{c.company_name}", c.id]}
  end
end
