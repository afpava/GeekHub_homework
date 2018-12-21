require 'rails_helper'

RSpec.describe PostsController, type: :controller do
      let(:user) { User.create(email: 'test@test.com', nickname: 'Test', first_name: 'First', last_name: 'Super', birth_date: '01-01-1954', password:'123test',role:'admin' ) }
      let(:person1) {User.create(email:'tw@com.com',password:'123test',nickname: 'Twilight Sparkle', birth_date: '2006-09-09').reload}
      let(:person2) {User.create(email:'rd@com.com',password:'123test',nickname: 'Rainbow Dash',birth_date: '2006-09-08').reload}
      let(:post_params){post_params = {title:"This is test#{rand(1000)}", text:'Test message'}}
  #before { allow(controller).to receive(:current_user) {user} }

  describe 'GET index' do
    context 'should return all Posts' do
        before do
          allow(controller).to receive(:current_user) {user}
          user
          post = user.posts.create(post_params)
          get :index params{user_id: user.id, post_id: post.id}
        end

        it{ expect(assigns(:post)).to include(user) }
    end

    context 'should redirect to sign_in if not authorized' do
      before do
        user
        get :index
      end

      it{ expect(response).to render_template('sessions/new.html.erb') }
    end

  end #GET index

end #Rspec
