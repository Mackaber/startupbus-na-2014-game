class Omniauthable < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise \
    :database_authenticatable,
    :omniauthable,
    :recoverable,
    :registerable,
    :rememberable,
    :trackable,
    :validatable

  #validates_presence_of :email
  validates_uniqueness_of :email

  def email_required?
    false
  end

  def self.from_omniauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider) do |omniauthable|
      omniauthable.provider = auth.provider
      omniauthable.uid = auth.uid
      omniauthable.name = auth.info.name
      omniauthable.email = auth.info.email
      omniauthable.type = type_from_email(omniauthable.email)
    end
  end

  def self.type_from_email(email)
    descendants.each do |descendant|
      return descendant.name if descendant.email_known?(email)
    end

    "Investor"
  end

  def self.email_known?(email)
    known_email_addresses.include?(email)
  end

  def self.known_email_addresses
    []
  end

  def password_required?
    false
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def approved?
    approved_at.present?
  end

  def approve!(approved_by)
    self.approved_by = approved_by
    touch :approved_at
  end

  def admin?
    false
  end
end
