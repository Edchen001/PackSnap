require "rails_helper"

describe LocationsController do
  describe "Get #new" do
    it 'assigns a new Location' do
      get :new
      expect(assigns[:location]).to be_a_new(Location)
    end

    it 'renders :new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "Post #create" do

    end
  end
end