require 'rails_helper'

RSpec.describe User, type: :model do

  context "validation tests" do

    it "ensures email presence" do
      user = User.create(email: '', password:"123test" )
      expect(user).to be_invalid

      # binding.pry
    end

    it "ensures email pattern" do
      user = User.create(email: 'test@test', password:"123test" )
      expect(user).to be_invalid
    end

    it "ensures email created" do
      user = User.create(email: 'test@test.com', password:"123test" )
      expect(user).to be_valid
    end

    it "ensures email uniqueness" do
      user1 = User.create(email: 'test@test.com', password:"123test" )
      user2 = User.create(email: 'test@test.com', password:"123test" )
      expect(user1).to be_valid
      expect(user2).to be_invalid
    end

    it "ensures password can't be blank" do
      user = User.create(email: 'test@test.com', password:'')
      expect(user).to be_invalid
    end

    it "ensures password patterns must contain letters on create" do
      user = User.create(email: 'test@test.com', password:'123456')
      expect(user).to be_invalid
    end

    it "ensures password must contain digits on create" do
      user = User.create(email: 'test@test.com', password:'qwertyui')
      expect(user).to be_invalid
    end

    it "ensures password length 6 symbols min on create" do
      user = User.create(email: 'test@test.com', password:'1qwer')
      expect(user).to be_invalid
    end

    it "ensures password length 10 symbols max on create" do
      user = User.create(email: 'test@test.com', password:'123456789qwer')
      expect(user).to be_invalid
    end

    it "ensures password length 6-10 symbols on create" do
      user = User.create(email: 'test@test.com', password:'123test')
      expect(user).to be_valid
    end


  end #validations

  describe "#full_name" do

      let(:user) { User.create(email: 'test@test.com', nickname: 'Test', first_name: 'First', last_name: 'Super', birth_date: "01-01-1900", password:"123test" ) }
      let(:blank_first) { User.create(email: 'admin@test.com', nickname: 'Blank', first_name: '', last_name: 'Super', password:"123test" ) }
      let(:blank_last) { User.create(email: 'admin2@test.com', nickname: 'Blank', first_name: 'Super', last_name: '', password:"123test" ) }

    it "should return full_name on fist_name and last_name presence" do
      expect(user.full_name).to eq (user.first_name + " " + user.last_name)
    end

    it "shoud return nul if first_name is blank" do
      expect(blank_first.full_name).to eq nil
    end

    it "shoud return nul if last_name is blank" do
      expect(blank_last.full_name).to eq nil
    end

  end #fill_name

  context "Time related birthdays" do
    let(:user) { User.create(email: 'test@test.com', nickname: 'Test', first_name: 'First', last_name: 'Super', birth_date: "01-01-1954", password:"123test" ) }

  before :each do
     @p1 = User.create(email:"tw@com.com",password:"123test",nickname: "Twilight Sparkle", birth_date: Date.parse('2006-09-09')).reload
     @p2 = User.create(email:"rd@com.com",password:"123test",nickname: "Rainbow Dash",birth_date: Date.parse('2004-10-08')).reload
   end

   it 'check #age correct' do
     travel_to(Date.parse('2011-09-09') + 3.hours) do
       expect(@p1.age).to eq 5
       expect(@p2.age).to eq 6
     end
   end

   it 'check #birthday_today? correctly' do
     travel_to(Date.parse('2011-09-09')) do
     expect(@p1).to be_birthday_today
     expect(@p2).not_to be_birthday_today
      end
   end


   it 'check .birthdays_this_month correct' do
     travel_to(Date.parse('2011-09-09')) do
      birthdays = User.birthdays_this_month
     expect(birthdays).to include(@p1)
     expect(birthdays).not_to include(@p2)
      end
   end

   it 'check .birthdays_today includes exect user' do
     travel_to(Date.parse('2018-01-01')) do
      birthdays_today = User.birthdays_today
     expect(birthdays_today).to include(user)
     expect(birthdays_today).not_to include(@p1)
     expect(birthdays_today).not_to include(@p2)
      end
   end


 end #Time related
end #User model
