require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "when Post.new is called" do
    let(:user) { User.create(email: 'test@test.com', nickname: 'Test', first_name: 'First', last_name: 'Super', birth_date: "01-01-1900", password:"123test" ) }
  #otm
  it "should be ok with an associated post" do
    post = user.posts.create(title:"test",text:"test")
    expect(post).to be_valid
  end

  it "should have an associated post" do
    user.should have_at_least(1).error_on(:posts)
  end

  #mtm
  it "should be ok with at least one associated user" do
    user.posts.build
    user.should have(:no).errors_on(:posts)
  end

  it "should have at least one associated user" do
    user.should have_at_least(1).error_on(:posts)
  end

end


end
