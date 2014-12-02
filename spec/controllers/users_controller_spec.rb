require "rails_helper"

describe UsersController do
  before do
    @user = create(:user)
    session[:user_id] = @user.id
  end

  describe "Get routes" do
    describe "Get #show" do
      it "should locate the requested user" do
        get :show, id: @user
        expect(assigns[:user]).to eq(@user)
      end

      it "should render :show template" do
        get :show, id: @user
        expect(response).to render_template(:show)
      end
    end

    describe "Get #edit" do
      it "should locate requested user" do
        get :edit, id: @user
        expect(assigns[:user]).to eq(@user)
      end

      it "should render :edit" do
        get :edit, id: @user
        expect(response).to render_template(:edit)
      end
    end

    describe "Get #new" do
      it "assigns a new User" do
        get :new
        expect(assigns[:user]).to be_a_new(User)
      end

      it "should render :signup template" do
        get :new
        expect(response).to render_template(:signup)
      end
    end
  end

  describe "Post #create" do
    context 'valid attributes' do
      it "should save user into database" do
        expect { post :create, user: attributes_for(:user) }.to change(User, :count).by(1)
      end

      it "should redirect to user profile" do
        post :create, user: attributes_for(:user)
        expect(response).to redirect_to(root_path)
      end

      it "should set session for that user" do
        post :create, user: attributes_for(:user)
        expect(session[:user_id]).to_not be_nil
      end
    end

    context 'invalid attributes' do
      it "should not save into the database" do
        expect { post :create, user: attributes_for(:invalid_user) }.to_not change(User, :count)
      end
      # it "should set up flash alert" do
      #   post :create, user: attributes_for(:invalid_user)
      #   expect(response.request.flash[:alert]).to_not be_nil
      # end

      it "should re-render :signup template" do
        post :create, user: attributes_for(:invalid_user)
        expect(response).to render_template(:signup)
      end
    end
  end

  describe "Put #update" do
    context 'valid attributes' do
      it "should locate requested user" do
        put :update, id: @user, user: attributes_for(:user)
        expect(assigns[:user]).to eq(@user)
      end

      it "should update attributes for requested user" do
        put :update, id: @user, user: attributes_for(:user, username: "updated")
        @user.reload
        expect(@user.username).to eq("updated")
      end

      it "should redirect to user profile" do
        put :update, id: @user, user: attributes_for(:user, username: "updated")
        expect(response).to redirect_to(user_path(@user))
      end
    end

    context 'invalid attributes' do
      it "should not save into the database" do
        put :update, id: @user, user: attributes_for(:invalid_user)
        @user.reload
        expect(@user.email).to_not be_nil
      end
      # it "should set up flash alert" do
      #   put :update, id: @user, user: attributes_for(:invalid_user)
      #   expect(response.request.flash[:alert]).to_not be_nil
      # end

      it "should re-render :edit template" do
        put :update, id: @user, user: attributes_for(:invalid_user)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "Delete #destroy" do
    it "should locate the requested user" do
      delete :destroy, id: @user
      expect(assigns[:user]).to eq(@user)
    end

    it "should validate its the same as the logged-in user" do
      delete :destroy, id: @user
      expect(session[:user_id]).to eq(@user.id)
    end

    it "should remove user from database" do
      expect { delete :destroy, id: @user }.to change(User, :count).by(-1)
    end

    it "should redirect to root_path" do
      delete :destroy, id: @user
      expect(response).to redirect_to(root_path)
    end
  end
end