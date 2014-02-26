class Team < ActiveRecord::Base
  has_many :buspreneurs, as: :attachable
  has_many :investments
  has_many :milestone_teams
  has_many :milestones, :through => :milestone_teams

  accepts_nested_attributes_for :milestone_teams

  belongs_to :bus

  validates :name, :website, :twitter_handle, :github_url, :facebook_url,
            :uniqueness => true

  validates :description, presence: true

  delegate :name, to: :bus, prefix: true, allow_nil: false

  def buspreneur_names
    buspreneurs.pluck(:email).to_sentence
  end

  def self.sorted_by_score
    Team.all.sort_by {|team| team.ranking}
  end

  #def pending_approvals
    #User.where(:team_id => self.id, :team_status => "pending")
  #end

  def funding
    @funding ||= investments.pluck(:amount).reduce(:+)
  end

  def score
    0
  end

  def all_milestones
    Milestone.all
  end    

  def milestones_completed
    MilestoneTeam.where(:team_id => self.id).map(&:milestone)
  end

  def milestones_pending
    Milestone.all - milestones_completed
  end
end
