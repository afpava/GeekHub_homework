require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "when Post.new is called" do
    let(:user) { User.create(email: 'test@test.com', nickname: 'Test', first_name: 'First', last_name: 'Super', birth_date: "01-01-1900", password:"123test" ) }
    let(:user1) { User.create(email: 'test1@test.com', nickname: 'Test1', first_name: 'First1', last_name: 'Super1', birth_date: "01-01-1900", password:"123test" ) }

  #otm
  it "should be ok with an associated post" do
    post = user.posts.create(title:"test",text:"test")
    expect(post).to be_valid
  end

  it "validation Title shouldn't be blank" do
    post = user.posts.create(title:"",text:"test")
    expect(post).not_to be_valid
  end

  it "validation Text shouldn't be blank" do
    post = user.posts.create(title:"test",text:"")
    expect(post).not_to be_valid
  end

  it "validation Title should be unique only for exect User" do
    post = user.posts.create(title:"test",text:"test")
    post1 = user.posts.create(title:"test",text:"test")
    post2 = user1.posts.create(title:"test",text:"test")
    expect(post).to be_valid
    expect(post1).not_to be_valid
    expect(post2).to be_valid
  end

end


end
