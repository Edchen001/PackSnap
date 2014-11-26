require 'rails_helper'

describe ItinerariesController do
  describe "itineraries Get routes" do
    before do
      @trip = create(:trip)
      @itinerary = create(:itinerary, trip: @trip)
    end
    describe "Get#show" do
      it "should locate the requested itinerary" do
        get :show, trip_id: @trip, id: @itinerary
        expect(assigns[:itinerary]).to eq(@itinerary)
      end
      it "should render :show template for itineraries" do
        get :show, trip_id: @trip, id: @itinerary
        expect(response).to render_template(:show)
      end
    end

    describe "Get#index" do
      it "should locate all itineraries" do
        get :index, trip_id: @trip
        expect(assigns[:itineraries]).to match_array([@itinerary])
      end
      it "should render :index template for itineraries" do
        get :index, trip_id: @trip
        expect(response).to render_template(:index)
      end
    end

    describe "Get#new" do
      it "should assign a new itinerary" do
        get :new, trip_id: @trip
        expect(assigns[:itinerary]).to be_a_new(Itinerary)
      end
      it "should render :new template for itineraries" do
        get :new, trip_id: @trip
        expect(response).to render_template(:new)
      end
    end

    describe "Get#edit" do
      it "should locate the requested itinerary" do
        get :edit, trip_id: @trip, id: @itinerary
        expect(assigns[:itinerary]).to eq(@itinerary)
      end
      it "should render :edit template for itineraries" do
        get :edit, trip_id: @trip, id: @itinerary
        expect(response).to render_template(:edit)
      end
    end
  end

  xdescribe "Post#create" do
    before do
      @trip = create(:trip)
    end
    context 'with valid attributes' do
      it "should save valid itinerary to database" do
        expect { post :create, trip_id: @trip, itinerary: attributes_for(:itinerary) }.to change(Itinerary, :count).by(1)
      end
      it "should redirect to itinerary :show" do
        post :create, trip_id: @trip, itinerary: attributes_for(:itinerary)
        expect(response).to redirect_to(trip_intinerary_path(assigns[:itinerary]))
      end
    end
    context 'with invalid attributes' do
      it "should not save into the database" do
        expect { post :create, trip_id: @trip, itinerary: attributes_for(:invalid_destination) }.to_not change(itinerary, :count)
      end
      it "should redirect back to :new route" do
        post :create, trip_id: @trip, itinerary: attributes_for(:invalid_destination)
        expect(response).to redirect_to(new_destination_path(assigns[:itinerary]))
      end
    end
  end

  xdescribe "Put#update" do
    before do
      @itinerary = create(:itinerary)
    end
    context 'with valid attributes' do
      it "should locate the requested itinerary" do
        put :update, trip_id: @trip, id: @itinerary, itinerary: attributes_for(:itinerary)
        expect(assigns[:itinerary]).to eq(@itinerary)
      end
      it "should update attributes" do
        put :update, trip_id: @trip, id: @itinerary, itinerary: attributes_for(:itinerary, trip_id: 1)
        @itinerary.reload
        expect(@itinerary.trip.id).to eq(1)
      end
      it "should redirect to itinerary :show" do
        put :update, trip_id: @trip, id: @itinerary, itinerary: attributes_for(:itinerary)
        expect(response).to redirect_to(trip_intinerary_path(assigns[:itinerary]))
      end
    end
    context 'with invalid attributes' do
      it "should not save into the database" do
        put :update, trip_id: @trip, id: @itinerary, itinerary: attributes_for(:invalid_destination)
        @itinerary.reload
        expect(@itinerary.location).to eq("Canton")
      end
      it "should redirect to :edit route" do
        put :update, trip_id: @trip, id: @itinerary, itinerary: attributes_for(:invalid_destination)
        expect(response).to redirect_to(edit_destination_path(assigns[:itinerary]))
      end
    end
  end

  xdescribe "Delete#destroy" do
    before :each do
      @itinerary = create(:itinerary)
    end
    it "should locate the requested itinerary" do
      delete :destroy, trip_id: @trip, id: @itinerary
      expect(assigns[:itinerary]).to eq(@itinerary)
    end
    it "should delete record from database" do
      expect { delete :destroy, trip_id: @trip, id: @itinerary }.to change(itinerary, :count).by(-1)
    end
    it "should redirect to :index" do
      delete :destroy, trip_id: @trip, id: @itinerary
      expect(response).to redirect_to(destinations_path)
    end
  end

end