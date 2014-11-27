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
end