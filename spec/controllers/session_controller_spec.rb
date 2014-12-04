require 'rails_helper'

describe SessionController do
  describe "Get#new" do
    it "should render login" do
      get :new
      expect(response).to render_template(:login)
    end
  end

  describe "Post#login" do
    before do
      @user = create(:user)
    end
    it "should set session with user id" do
      post :login, user: attributes_for(:user, email: @user.email)
      expect(session[:user_id]).to eq(assigns[:user].id)
    end
    it "should redirect to root_path" do
      post :login, user: attributes_for(:user, email: @user.email)
      expect(response.status).to eq(200)
    end
  end

  describe "Delete#logout" do
    it "should set session[:user_id] back to nil" do
      delete :logout
      expect(session[:user_id]).to be_nil
    end
  end
end