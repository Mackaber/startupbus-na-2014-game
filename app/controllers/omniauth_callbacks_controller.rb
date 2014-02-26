require 'net/http'
require 'net/https'
require 'json'

class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    # raise request.env["omniauth.auth"].to_yaml
    omniauthable = Omniauthable.from_omniauth(request.env["omniauth.auth"])

    if omniauthable.persisted?
      flash.notice = "Signed In!"
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
    http = Net::HTTP.new("northamerica.startupbus.com",443)
    req = Net::HTTP::Get.new("/index.php?__api=1&buspreneurs=#{current_user.email}")
    http.use_ssl = true

    req.basic_auth ENV["STARTUPBUS_WP_USERNAME"], ENV["STARTUPBUS_WP_PASS"]
    begin
      response = http.request(req)
      if !response.kind_of? Net::HTTPNotFound
        buspreneur = JSON.parse(response.body)
        if buspreneur['email'] == current_user.email && current_user.approved_at.nil?
          current_user.approved_at = Time.now
          current_user.save!
        end
      end
    rescue Exception => e
      puts "Error requesting buspreneur approval: #{e.inspect}"
    end
  end
  
end
