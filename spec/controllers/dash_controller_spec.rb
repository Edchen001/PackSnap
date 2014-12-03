require 'rails_helper'

describe DashController do
  describe 'Get #index' do
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
  end

end
