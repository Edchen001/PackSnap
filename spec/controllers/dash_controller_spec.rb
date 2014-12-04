require 'rails_helper'

describe DashController do
  describe 'Get #index' do
    xit "renders the :dashboard template" do
      get :index, location: {address: "New York, NY, USA", latitude: 40.71, longitude: -71.52}, forecast: {latitude: 40.71, longitude: -74.01, date: '2014-12-03'}
      expect(response).to render_template :dashboard
    end
  end

  describe 'Get #new' do
    context 'with user signed in' do
      before do
        session[:user_id] = 1
      end
      after do
        session[:user_id] = nil
      end
      it 'assigns a new Item' do
        get :new
        expect(assigns[:item]).to be_a_new(Item)
      end

      it 'renders :new template' do
        get :new
        expect(response).to render_template(partial: "dash/_new_item_form")
      end
    end
    context 'without user signed in' do
      it "should render error" do
        get :new
        expect(response).to render_template(partial: "dash/_error")
      end
    end
  end

  describe 'Post #create' do
    it 'saves item into database' do
      session[:user_id] = 666
      expect { post :create, item: attributes_for(:item), comment: attributes_for(:comment), location: {id: 1}, comment: {content: "test", user_id: 1, id: 1}}.to change(Item, :count).by(1)
    end
  end
end
