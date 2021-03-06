class Bus < ActiveRecord::Base
  validates :name, :uniqueness => true

  validates_format_of :image_url, with: URI::regexp(%w(http https)), allow_blank: true

  has_many :conductors
  has_many :teams
  has_many :team_buspreneurs, through: :teams
  has_many :buspreneurs

  def conductor_names
    conductors.pluck(:name).to_sentence
  end

  def team_names
    teams.pluck(:name).to_sentence
  end

  def photo_url(options = {})
    if image_url.present?
      return "#{image_url}?#{options.to_param}"
    else
      [
        "http://placehold.it/#{options.fetch(:height, 50)}x#{options.fetch(:width, 50)}",
        "http://placekitten.com/g/#{options.fetch(:height, 50)}/#{options.fetch(:width, 50)}"
      ].shuffle.first
    end
  end
end
