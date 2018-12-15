require 'rails_helper'

RSpec.describe UsersController, type: :controllers do
  let(:user) {User.create(email: 'test@test.com', password:'123test')}
  before { allow(controller).to recieve(:current_user) {user} }

  describe 'GET index' do
    context 'should return all Users' do
        before do
          user
          get :index
        end

        it{ expect(assigns(:users)).to include(user) }
    end
  end

end #Rspec
