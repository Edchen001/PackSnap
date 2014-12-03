require 'rails_helper'

describe DashController do
  describe 'Get #index' do
    # it "renders the :index template" do
    #   get :index, location: {address: "New York", latitude: 40.71, longitude: -71.52}, forecast: {latitude: 40.71, longitude: -74.01, date: '2014-12-03'}
    #   expect(response).to render_template :dashboard
    # end
  end

  describe 'Get #new' do
    it 'assigns a new Item' do
      get :new
      expect(assigns[:item]).to be_a_new(Item)
    end

    it 'renders :new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'Post #create' do
    it 'saves item into database' do
      expect { post :create, item: attributes_for(:item), comment: attributes_for(:comment), location: {id: 1}, comment: {content: "test", user_id: 1, id: 1}}.to change(Item, :count).by(1)
    end
  end

end
