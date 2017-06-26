require 'rails_helper'

describe UsersController, type: :controller do
	before do
		@user = User.create!(email: 'fakemail@gmail.com', password: '123456', first_name: 'steve', last_name: 'brown')
		@user2 = User.create!(email: 'fakemail2@gmail.com', password: '123456', first_name: 'bob', last_name: 'smith')
	end
	describe 'GET #show' do
		context 'when a user is logged in' do
			before do
				sign_in @user
			end
			it 'loads correct user details' do
				get :show, params: { id: @user.id }
				expect(assigns(:user)).to eq @user
				expect(response).to have_http_status(200)
			end
			it 'cant access other users show page' do
				get :show, params: { id: @user2.id}
				expect(resonse).to redirect_to(root_path)
			end
		end

		context 'User is not logged in' do
			it 'redirects to login' do
				get :show, params: { id: @user.id }
				expect(response).to redirect_to(new_user_session_path)
			end
		end
		
	end
end