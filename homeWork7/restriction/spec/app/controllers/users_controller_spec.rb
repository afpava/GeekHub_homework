require 'rails_helper'

RSpec.describe UsersController, type: :controller do
      let(:user) { User.create(email: 'test@test.com', nickname: 'Test', first_name: 'First', last_name: 'Super', birth_date: '01-01-1954', password:'123test' ) }
      let(:person1) {User.create(email:'tw@com.com',password:'123test',nickname: 'Twilight Sparkle', birth_date: '2006-09-09').reload}
      let(:person2) {User.create(email:'rd@com.com',password:'123test',nickname: 'Rainbow Dash',birth_date: '2006-09-08').reload}
  #before { allow(controller).to receive(:current_user) {user} }

  describe 'GET #new' do

    context 'assigns a new User to @user ' do
      before do
        get :new
      end

      it 'if no current_user' do
        expect(assigns(:user)).to be_a_new(User)
      end
    end

    context 'should redirect to root_path' do
      before do
        allow(controller).to receive(:current_user) {user}
        user
        get :new
      end

      it{ expect(response).to redirect_to(root_path)}
    end

  end #GET #new

  describe 'GET index' do
    context 'should return all Users' do
        before do
          allow(controller).to receive(:current_user) {user}
          user
          get :index
        end

        it{ expect(assigns(:users)).to include(user) }
    end

    context 'should redirect to sign_in if not authorized' do
      before do
        user
        get :index
      end

      it{ expect(response).to render_template('sessions/new.html.erb') }
    end

    context 'should return current_user as a user' do
        before do
          allow(controller).to receive(:current_user) {user}
          user
          get :index
        end
        it{ expect(assigns(:user)).to eq (user) }
    end

    context 'should return user if user has a birthday this month' do

        before do
          travel_to(Date.parse('2011-09-09'))
          allow(controller).to receive(:current_user) {user}
          user
          person1
          person2
          get :index
        end

        it '2 users must have birthday this month one should not' do
          expect(assigns(:birthdays)).to include(person2)
          expect(assigns(:birthdays)).to include(person1)
          expect(assigns(:birthdays)).not_to include(user)
        end

        it 'should return sorted by birth_date' do
          expect(assigns(:birthdays).first).to eq person2
        end

     end

     context 'should return first user has birthday' do

       before do
         travel_to(Date.parse('2011-09-09'))
         allow(controller).to receive(:current_user) {user}
         user
         person1
         person2
         get :index
       end

       it do
         expect(assigns(:first_birthday)).to eq person1
       end

     end

  end #GET index

  describe 'GET #show' do
    context 'should return all Users' do
        before do
          allow(controller).to receive(:current_user) {user}
          user
          get :show, params: { id: user.id.to_s }
        end

        it{ expect(assigns(:users)).to include(user) }
    end

    context 'should redirect to sign_in if not authorized' do
      before do
        user
        get :show, params: { id: user.id.to_s }
      end

      it{ expect(response).to render_template('sessions/new.html.erb') }
    end

    context 'should return user if user has a birthday this month' do

        before do
          travel_to(Date.parse('2011-09-09'))
          allow(controller).to receive(:current_user) {user}
          user
          person1
          person2
          get :show, params: { id: user.id.to_s }
        end

        it '2 users must have birthday this month one should not' do
          expect(assigns(:birthdays)).to include(person2)
          expect(assigns(:birthdays)).to include(person1)
          expect(assigns(:birthdays)).not_to include(user)
        end

        it 'should return sorted by birth_date' do
          expect(assigns(:birthdays).first).to eq person2
        end

     end

  end #GET show

  describe "POST users#create" do
    before do
      #allow(controller).to receive(:current_user) {user}
      #user
      get :create, params: { email: 'test1@test.com', nickname: 'Test1', first_name: 'First', last_name: 'Super', birth_date: '01-01-1954', password:'123test' }
    end
  it 'should create a new user' do
      visit new_users_path
    fill_in 'story_title', with: 'Ruby on Rails'
    fill_in 'story_content', with: 'Text about Ruby on Rails'
    expect { click_button 'Create' }.to change(User, :count).by(1)
  end
end #POST #create


end #Rspec
