require 'spec_helper'

describe EventsController do

  it 'display events for today' do
    event = FactoryGirl.create(:event, start_at: Date.today)
    expect(Event).to receive(:for_today).and_call_original
    get :index

    expect(assigns(:events)).to eq([event])
  end

  describe "#create" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    it "creates an event" do
       attrs = FactoryGirl.attributes_for(:event)
       expect {
         post :create, event: attrs
       }.to change(Event, :count)

       expect(response).to redirect_to(assigns(:event))
    end

    it "renders the form when invalid" do
      post :create, event: {name: "la" }
      expect(response).to render_template(:new)
    end
  end

  describe '#rescue' do
    it "event does not exist" do
      get :show, id: 950
      expect(response).to render_template(:not_found) 
    end
  end
end

