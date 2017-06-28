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
			it "loads correct user details" do
        		get :show, id: @user.id
        		expect(response).to be_ok
        		expect(assigns(:user)).to eq @user
      		end
    	end
    
    	context "when a user is not logged in" do
      		it "redirects to login" do
        		get :show, id: @user.id
        		expect(response).to redirect_to(new_user_session_path)
      		end
    	end
    
    	context "when user tries to view user2's page" do
      		before do
        		sign_in @user
      		end
      
      		it "redirects to root" do
        		get :show, id: @user2.id
        		expect(response).to redirect_to(root_path)
			end
		end
		
	end
end