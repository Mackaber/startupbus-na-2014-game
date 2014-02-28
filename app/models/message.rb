class Message < ActiveRecord::Base
	belongs_to :conductor
  has_many :team_messages
	has_many :teams, :through => :team_messages

  attr_accessible :body, :subject, :delivery_method, :conductor_id, :team_ids

  def team_names
    teams.pluck(:name).to_sentence
  end

  after_create :send_message
  def send_message
    self.sent = 0
    if delivery_method == "SMS" then
    else
      teams.each do |team|
        team.buspreneurs.each do |buspreneur|
          MessageSender.send_message_email(subject, body, conductor, buspreneur).deliver
          self.sent = self.sent + 1
        end
      end
    end
    self.save
  end
end
