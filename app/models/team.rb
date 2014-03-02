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

  validates_format_of :website, :with => URI::regexp(%w(http https)), :allow_nil => true, :allow_blank => true
 # validates_format_of :logo_url, :with => URI::regexp(%w(http https)), :allow_nil => true, :allow_blank => true

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
    total_points
  end

  def <=>(other)
    other.score <=> score
  end

  def all_milestones
    Milestone.where("start_at <= :start", :start => Date.today)
  end

  def milestones_uncompleted
    Milestone.where("start_at <= :start", :start => Date.today).where.not(id: milestone_ids).where.not(id: team_milestone_requests.collect(&:milestone_id).uniq)
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
    [total_points,0].max.floor
  end

  def total_points
    total_points = funding
    max_points ||= Milestone.all.pluck(:max_points).reduce(:+) || 1
    if max_points == 0
      max_points = 1
    end
    #max_funds = Investment.all.pluck(:amount).reduce(:+)
    #mult = [funding / max_funds, 0.1].max
    mult = [milestone_points / max_points, 0.1].max
    total_points *= mult
    num_investments = Investment.count
    if num_investments == 0
      num_investments = 1
    end
    mult = [investments.count / num_investments, 0.1].max
    total_points *= mult
    if clicks
      total_points += clicks * mult * 15
    end
    [total_points,0].max.floor
  end

end
