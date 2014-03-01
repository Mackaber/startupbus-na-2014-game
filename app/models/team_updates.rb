class TeamUpdates < ActiveRecord::Base
  belongs_to :team
  validates_presence_of :body, :subject
end
