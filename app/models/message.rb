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
    teams.each do |team|
      team.buspreneurs.each do |buspreneur|
        if delivery_method == "SMS" and buspreneur.phone_number?
          MessageSender.send_message_sms(body, conductor, buspreneur).deliver
          self.sent = self.sent + 1 
        elsif delivery_method == "E-Mail" and buspreneur.email?
            MessageSender.send_message_email(subject, body, conductor, buspreneur).deliver
            self.sent = self.sent + 1
        end
      end
    end

    self.save
  end
end
