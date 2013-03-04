require 'spec_helper'

describe User do

  before do
    @user = User.new(name:"Nikhat Fatima", email:"genuine.kmu@gmail.com")
  end
  describe "when email is not present" do
    before {@user.email = ""}
    it {should_not be_valid}
  end
end
