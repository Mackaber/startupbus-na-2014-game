class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    # raise request.env["omniauth.auth"].to_yaml
    omniauthable = Omniauthable.from_omniauth(request.env["omniauth.auth"])

    if omniauthable.persisted?
      flash.notice = "Signed In, Bro!"
      sign_in_and_redirect omniauthable
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
end
