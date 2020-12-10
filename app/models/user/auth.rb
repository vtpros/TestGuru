module User::Auth

  extend ActiveSupport::Concern

  attr_reader :password
  attr_writer :password_confirmation

  included do
    validates :email, presence: true
    validates :password, presence: true, if: Proc.new { |u| u.password_digest.blank?}
    validates :password, confirmation: true
  end

  def authenticate(password)
    (digest(password) ==  password_digest) ? self : false
  end

  def password=(password)
    if password.nil?
      self.password_digest = nil
    elsif password.present?
      @password = password
      self.password_digest = digest(password)
    end
  end

  private

  def digest(password)
    Digest::SHA1.hexdigest(password)
  end
end
