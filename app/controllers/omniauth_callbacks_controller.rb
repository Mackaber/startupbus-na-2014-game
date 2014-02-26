class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    # raise request.env["omniauth.auth"].to_yaml
    omniauthable = Omniauthable.from_omniauth(request.env["omniauth.auth"])

    if omniauthable.persisted?
      flash.notice = "Signed In, Bro!"
      sign_in_and_redirect omniauthable
      check_buspreneur_approval(current_user)
    else
      session["devise.user_attributes"] = omniauthable.attributes
      flash.notice = "This didn't work :("
      redirect_to new_user_registration_url
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |omniauthable|
        omniauthable.attributes = params
        omniauthable.valid?
      end
    else
      super
    end
  end

  alias_method :twitter, :all
  alias_method :facebook, :all

  private

  def check_buspreneur_approval(current_user)
    if ENV["BUSPRENEUR_EMAIL_ADDRESSES"].include?(current_user.email) && current_user.approved_at.nil?
      current_user.approved_at = Time.now
      current_user.save!
    end
  end
  
end
