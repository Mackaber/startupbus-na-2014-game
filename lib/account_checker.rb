require 'net/http'
require 'net/https'
require 'json'

module AccountChecker
  module Type
    BUSPRENEURS = "buspreneurs"
    CONDUCTORS = "conductors"
  end
  extend self

  def knows_about?(email, type = Type::BUSPRENEURS)
    !!info_for(email, type)
  end

  def info_for(email, type = Type::BUSPRENEURS)
    return cache(email, type) if cached?(email, type)
    set_cache(email, type, body_for_query(query_for(email, type)))
  end

  private

  def body_for_query(query)
    JSON.parse(response(query))
  rescue JSON::ParserError
    nil
  end

  def cache(email, type)
    @members[type][email]
  end

  def cached?(email, type)
    @members ||= {}
    @members[type] ||= {}
    @members[type].has_key?(email)
  end

  # Side effect: it returns the body
  def set_cache(email, type, body)
    @members[type] ||= {}
    @members[type][email] = body
  end

  def query_for(email, type)
    "/index.php?__api=#{api_version}&#{type}=#{email}"
  end

  def response(query)
    http.request(get_request(query)).body
  end

  def http
    Net::HTTP.new(hostname, port).tap do |http|
      http.use_ssl = true
    end
  end

  def get_request(query)
    Net::HTTP::Get.new(query).tap do |request|
      request.basic_auth username, password
    end
  end

  def hostname
    ENV["STARTUPBUS_WP_HOSTNAME"].tap do |hostname|
      raise "No hostname set" if hostname.nil?
    end
  end

  def port
    ENV["STARTUPBUS_WP_PORT"].tap do |port|
      raise "No port set" if port.nil?
    end
  end

  def username
    ENV["STARTUPBUS_WP_USERNAME"].tap do |username|
      raise "No username set" if username.nil?
    end
  end

  def password
    ENV["STARTUPBUS_WP_PASS"].tap do |password|
      raise "No password set" if password.nil?
    end
  end

  def api_version
    "1"
  end

end
