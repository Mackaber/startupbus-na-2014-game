class Message < ActiveRecord::Base
	belongs_to :conductor
	has_many :teams, :through => :team_messages

  def team_names
    teams.pluck(:name).to_sentence
  end
end
