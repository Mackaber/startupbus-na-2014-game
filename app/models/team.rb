class Team < ActiveRecord::Base
  include Enumerable

  belongs_to :bus

  has_many :buspreneurs
  has_many :team_updates
  has_many :investments, :dependent => :delete_all
  has_many :milestone_teams
  has_many :milestones, :through => :milestone_teams
  has_many :team_milestone_requests
  has_many :messages, :through => :team_messages

  accepts_nested_attributes_for :milestone_teams, :allow_destroy => true

  validates :name, :website, :uniqueness => true

#  validates_uniqueness_of :twitter_handle, :github_url, :facebook_url, :allow_blank => true, :allow_nil => true


  validates :description, presence: true

  validates_format_of :website, :with => URI::regexp(%w(http https))
  validates_format_of :logo_url, :with => URI::regexp(%w(http https)), :allow_nil => true, :allow_blank => true

  delegate :name, :photo_url, to: :bus, prefix: true, allow_nil: true

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
    @funding ||= investments.pluck(:amount).reduce(:+) || 0
  end

  def score
    funding
  end

  def <=>(other)
    other.score <=> score
  end

  def all_milestones
    Milestone.where("start_at <= :start", :start => Date.today)
  end

  def milestones_uncompleted
    Milestone.where("start_at <= :start", :start => Date.today).where.not(id: milestone_ids).where.not(id: team_milestone_request_ids)
  end

  def milestones_pending
    Milestone.where(id: TeamMilestoneRequest.where(id: team_milestone_request_ids).map(&:milestone_id))
  end

  def photo_url(options = {})
    if logo_url.present?
      return "#{logo_url}?#{options.to_param}"
    else
      [
        "http://placehold.it/#{options.fetch(:height, 50)}x#{options.fetch(:width, 50)}",
        "http://placekitten.com/g/#{options.fetch(:height, 50)}/#{options.fetch(:width, 50)}"
      ].shuffle.first
    end
  end

  def milestone_points
    total_points = 0
    milestone_teams.each do |point|
      total_points += point.milestone.max_points
    end
    total_points
  end

  def total_points
    mpoints = milestone_points
  end

end
