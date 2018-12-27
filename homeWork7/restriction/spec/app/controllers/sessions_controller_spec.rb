require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { User.create(email: 'test@test.com', nickname: 'Test', first_name: 'First', last_name: 'Super', birth_date: '01-01-1954', password:'123test',role:'admin' ) }
  # let(:person1) {User.create(email:'tw@com.com',password:'123test',nickname: 'Twilight Sparkle', birth_date: '2006-09-09').reload}
  # let(:person2) {User.create(email:'rd@com.com',password:'123test',nickname: 'Rainbow Dash',birth_date: '2006-09-08').reload}

  let(:user_params) { user_params = { email: 'test@test.com',  password:'123test' } }

  before do
    user_params
  end

  describe "#create" do

    it "should successfully create a user" do
      expect { post :create, params: { user: user_params }}.to redirect_to root_path
    end

    it "should successfully create a session" do
      expect( {session[:user_id]}).to be_nil
      post :create, params: { user: user_params }
      expect {session[:user_id]}.not_to eq nil
    end

    # it "should redirect the user to the root url" do
    #   post :create, provider: :github
    #   response.should redirect_to root_url
    # end

  end # sessios#create

  # describe "#destroy" do
  #   before do
  #     post :create, provider: :github
  #   end
  #
  #   it "should clear the session" do
  #     session[:user_id].should_not be_nil
  #     delete :destroy
  #     session[:user_id].should be_nil
  #   end
  #
  #   it "should redirect to the home page" do
  #     delete :destroy
  #     response.should redirect_to root_url
  #   end
  # end #sessios#destroy

end #Rspec
