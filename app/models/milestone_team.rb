class MilestoneTeam < ActiveRecord::Base
  belongs_to :milestone
  belongs_to :team

  validates_uniqueness_of :team_id, scope: [:milestone_id]

  validate :awarded_points_must_be_less_than_max_points
 
  def awarded_points_must_be_less_than_max_points
    if awarded_points > milestone.max_points
      errors.add(:too_many_points_awarded, "Must be less than max points allowed for milestone.")
    end
  end
end