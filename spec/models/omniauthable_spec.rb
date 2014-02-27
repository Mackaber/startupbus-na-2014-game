require 'spec_helper'

describe Omniauthable do
  describe ".type_from_email" do
    before do
      Buspreneur.stub(:knows_about?).and_return(false)
      Conductor.stub(:knows_about?).and_return(false)
      Buspreneur.stub(:knows_about?).with("buspreneur_1@gmail.com").and_return(true)
      Conductor.stub(:knows_about?).with("conductor_1@gmail.com").and_return(true)
    end

    it { described_class.type_from_email("buspreneur_1@gmail.com").should eq "Buspreneur" }
    it { described_class.type_from_email("conductor_1@gmail.com").should eq "Conductor" }
    it { described_class.type_from_email("yadda@gmail.com").should eq "Investor" }

  end
end
