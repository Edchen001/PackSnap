require 'rails_helper'

describe DestinationsController do
  describe "Destinations Get routes" do
    before do
      @destination = create(:destination)
    end
    describe "Get#show" do
      it "should locate the requested destination" do
        get :show, id: @destination
        expect(assigns[:destination]).to eq(@destination)
      end
      it "should render :show template for destinations" do
        get :show, id: @destination
        expect(response).to render_template(:show)
      end
    end

    describe "Get#index" do
      it "should locate all destinations" do
        get :index
        expect(assigns[:destinations]).to match_array([@destination])
      end
      it "should render :index template for destinations" do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe "Get#new" do
      it "should assign a new Destination" do
        get :new
        expect(assigns[:destination]).to be_a_new(Destination)
      end
      it "should render :new template for destinations" do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe "Get#edit" do
      it "should locate the requested destination" do
        get :edit, id: @destination
        expect(assigns[:destination]).to eq(@destination)
      end
      it "should render :edit template for destinations" do
        get :edit, id: @destination
        expect(render).to render_template(:edit)
      end
    end
  end

  describe "Post#create" do
    before do
      @destination = create(:destination)
    end
    context 'with valid attributes' do
      it "should save valid destination to database" do
        expect { post :create, destination: attributes_for(:destination) }.to change(Destination, :count).by(1)
      end
      it "should redirect to destination :show" do
        post :create, destination: attributes_for(:destination)
        expect(response).to redirect_to(destination_path(assigns[:destination]))
      end
    end
    context 'with invalid attributes' do
      it "should not save into the database" do
        expect { post :create, destination: attributes_for(:invalid_destination) }.to_not change(Destination, :count)
      end
      it "should re-render :new template" do
        post :create, destination: attributes_for(:invalid_destination)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "Put#update" do
    before do
      @destination = create(:destination)
    end
    context 'with valid attributes' do
      it "should locate the requested destination" do
        put :update, id: @destination, destination: attributes_for(:destination)
        expect(assigns[:destination]).to eq(@destination)
      end
      it "should update attributes" do
        put :update, id: @destination, destination: attributes_for(:destination, location: "New York")
        @destination.reload
        expect(@destination.location).to eq("New York")
      end
      it "should redirect to destination :show" do
        put :update, id: @destination, destination: attributes_for(:destination)
        expect(reposne).to redirect_to(destination_path(assigns[:destination]))
      end
    end
    context 'with invalid attributes' do
      it "should not save into the database" do
        put :update, id: @destination, destination: attributes_for(:destination, location: nil)
        @destination.reload
        expect(@destination.location).to eq("Canton")
      end
      it "should re-render :edit" do
        put :update, id: @destination, destination: attributes_for(:destination)
        expect(resposne).to render_template(:edit)
      end
    end
  end

  describe "Delete#destroy" do
    before :each do
      @destination = create(:destination)
    end
    it "should locate the requested destination" do
      delete :destroy, id: @destination
      expect(assigns[:destination]).to eq(@destination)
    end
    it "should delete record from database" do
      expect { delete :destroy, id: @destination }.to change(Destination, :count).by(-1)
    end
    it "should redirect to :index" do
      delete :destroy, id: @destination
      expect(resposne).to redirect_to(desinations_path)
    end
  end

end