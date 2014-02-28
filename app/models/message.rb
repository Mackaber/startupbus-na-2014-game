class Message < ActiveRecord::Base
	belongs_to :conductor
	belongs_to :team
end
