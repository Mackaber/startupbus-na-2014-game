class Milestone < ActiveRecord::Base
  has_and_belongs_to_many :teams
  has_many :buspreneurs, through: :teams
end
