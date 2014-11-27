require 'rails_helper'

describe TripsController do
  describe "Get routes" do
    before do
      @trip = create(:trip)
    end

    describe "Get#index" do
      it "should locate requested trips" do
        get :index
        expect(assigns[:trips]).to match_array([@trip])
      end
      it "should render :index trips" do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe "Get#new" do
      it "should assign a new Trip" do
        get :new
        expect(assigns[:trip]).to be_a_new(Trip)
      end
      it "should render :new trip" do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe "Get#show" do
      it "should locate the requested trip" do
        get :show, id: @trip
        expect(assigns[:trip]).to eq(@trip)
      end
      it "should render :show trips" do
        get :show, id: @trip
        expect(response).to render_template(:show)
      end
    end

    describe "Get#edit" do
      it "should locate the requested trip" do
        get :edit, id: @trip
        expect(assigns[:trip]).to eq(@trip)
      end
      it "should render :edit trip" do
        get :edit, id: @trip
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "Post#create" do
    context 'valid attributes' do
      it "should save into database" do
        expect { post :create, trip: attributes_for(:trip) }.to change(Trip, :count).by(1)
      end
      it "should redirect to trip :show" do
        post :create, trip: attributes_for(:trip)
        expect(response).to redirect_to(trip_path(assigns[:trip]))
      end
    end

    context 'invalid attributes' do
      it "should not save into the database" do
        expect { post :create, trip: attributes_for(:invalid_trip) }.to_not change(Trip, :count)
      end
      it "should set flash[:alert]" do
        post :create, trip: attributes_for(:invalid_trip)
        expect(response.request.flash[:alert]).to_not be_nil
      end
      it "should re-render :new template" do
        post :create, trip: attributes_for(:invalid_trip)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "Put#update" do
    before do
      @trip = create(:trip)
    end
    context 'valid attributes' do
      it "should locate requested trip" do
        put :update, id: @trip, trip: attributes_for(:trip)
        expect(assigns[:trip]).to eq(@trip)
      end
      it "should update attributes into database" do
        put :update, id: @trip, trip: attributes_for(:trip, title: "Rspec")
        @trip.reload
        expect(@trip.title).to eq("Rspec")
      end
      it "should redirect to trip :show" do
        put :update, id: @trip, trip: attributes_for(:trip)
        expect(response).to redirect_to(trip_path(@trip))
      end
    end
    context 'invalid attributes' do
      it "should not save into database" do
        put :update, id: @trip, trip: attributes_for(:invalid_trip)
        @trip.reload
        expect(@trip.title).to_not be_nil
      end
      it "should set flash[:alert]" do
        put :update, id: @trip, trip: attributes_for(:invalid_trip)
        expect(response.request.flash[:alert]).to_not be_nil
      end
      it "should re-render :edit" do
        put :update, id: @trip, trip: attributes_for(:invalid_trip)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "Delete#destroy" do
    before :each do
      @trip = create(:trip)
    end
    it "should locate the requested trip" do
      delete :destroy, id: @trip
      expect(assigns[:trip]).to eq(@trip)
    end
    it "should delete from database" do
      expect { delete :destroy, id: @trip }.to change(Trip, :count).by(-1)
    end
    it "should redirect to :index trips" do
      delete :destroy, id: @trip
      expect(response).to redirect_to(trips_path)
    end
  end

end