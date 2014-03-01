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
    omniauthable = find_or_initialize_by(uid: auth.uid, provider: auth.provider) do |obj|
      obj.provider = auth.provider
      obj.uid = auth.uid
    end

    unless omniauthable.imported?
      omniauthable.set_provider_attributes(auth)
      omniauthable = set_type_and_approval(omniauthable)
      omniauthable.set_wp_attributes
      omniauthable.save
    end

    omniauthable
  end

  def self.set_type_and_approval(omniauthable)
    type = type_from_email(omniauthable.email)
    omniauthable.type = type_from_email(omniauthable.email)
    omniauthable.save

    type.constantize.find(omniauthable.id).tap do |obj|
      obj.approve! if obj.respond_to?(:approve!)
    end
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

  def set_provider_attributes(auth)
    self.name = auth.info.name
    self.email = auth.info.email
  end

  def set_wp_attributes
    info = AccountChecker.info_for(email, self.class.checker_type) || {}

    self.blog         = info["blog"].presence
    self.description  = info["bio"].presence
    self.facebook     = info["facebook"].presence
    self.foursquare   = info["foursquare"].presence
    self.github       = info["github"].presence
    self.linkedin     = info["linkedin"].presence
    self.phone_number = info["phone"].presence
    self.twitter      = info["twitter"].presence
    self.website      = info["website"].presence

    if info["bus"].present?
      self.bus = Bus.find_by(name: info["bus"])
    end

    self.imported = true
  end

  def password_required?
    false
  end

  def social_media_image_url
    if provider == "facebook" && uid.present?
      "http://graph.facebook.com/#{uid}/picture"
    else
      nil
    end
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def photo_url(options = {})
    if social_media_image_url.present?
      return "#{social_media_image_url}?#{options.to_param}"
    else
      [
        "http://placehold.it/#{options.fetch(:height, 50)}x#{options.fetch(:width, 50)}",
        "http://placekitten.com/g/#{options.fetch(:height, 50)}/#{options.fetch(:width, 50)}"
      ].shuffle.first
    end
  end

  def approved?
    approved_at.present?
  end

  def admin?
    false
  end
end
