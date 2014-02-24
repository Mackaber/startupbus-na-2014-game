require 'spec_helper'

describe Team do
  it "should have multiple users" do 
  end

  it "should should accept a user request to join a team and prompt current team members for approval" do
    @user = User.new
    @user.request_team_invitation.should_receive(:prompt_team_members)
  end

  it "should "
end


=begin  
Add a Team model

Teams should have a Name, Website, Twitter handle, Facebook link, Github link, and description.

Teams have multiple Users, but Users only belong to 1 team.

Any User can Request to Join a Team. Any Team member should be able to approve a new User.

Any Team member may edit the Team's details

after the user OAuths they are prompted to complete their profile, pick which bus they are on, and then pick (or create) a team
=end