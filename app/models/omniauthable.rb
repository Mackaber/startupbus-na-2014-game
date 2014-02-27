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
    omniauthable = find_or_initialize_by(uid: auth.uid, provider: auth.provider) do |omniauthable|
      omniauthable.provider = auth.provider
      omniauthable.uid = auth.uid
      if auth.provider == "facebook"
        omniauthable.social_media_image_url = "http://graph.facebook.com/#{auth.uid}/picture"
      end
    end

    omniauthable.set_attributes(auth)
    set_type_and_approval(omniauthable)
    omniauthable
  end

  def self.set_type_and_approval(omniauthable)
    type = type_from_email(omniauthable.email)
    omniauthable.type = type_from_email(omniauthable.email)
    omniauthable.save
    omniauthable = type.constantize.find(omniauthable.id)
    omniauthable.approve! if omniauthable.respond_to?(:approve!)
  end

  def self.type_from_email(email)
    descendants.each do |descendant|
      return descendant.name if descendant.knows_about?(email)
    end

    "Investor"
  end

  def self.knows_about?(email)
    false
  end

  def set_attributes(auth)
    self.name = auth.info.name
    self.email = auth.info.email
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

  def photo_url(options = {})
    "#{social_media_image_url}?#{options.to_param}"
  end

  def approved?
    approved_at.present?
  end

  def admin?
    false
  end
end
