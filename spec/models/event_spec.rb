require 'spec_helper'

describe Event do
  it "should be error when name is not present"do
    event = Event.new name: nil
    expect(event).to have(1).error_on(:name)
  end
  it "should not be error when name is present" do
    event = Event.new name: "Hey"
    expect(event).not_to have(1).error_on(:name)
  end
  it "should be error when name longer than 60 characters" do
    event = Event.new name: "a"*61
    expect(event).to have(1).error_on(:name)
  end
  it "should not be error when name not longer than 60 characters" do
    event = Event.new name: "a"*60
    expect(event).not_to have(1).error_on(:name)
  end

  describe 'description' do
    it 'is valid when blank' do
      event = Event.new description: ""
      expect(event).to have(0).error_on(:description)
    end
    it "is not valid when it has less than 100 characters" do
      event = Event.new description: "b"*99
      expect(event).to have(1).error_on(:description)
    end 
    it "is valid when it has 100 characters" do
      event = Event.new description: "b"*100
      expect(event).to have(0).error_on(:description)
    end
  end

  describe 'start_at' do
    it "is invalid when blank" do
      event = Event.new start_at: ""
      expect(event).to have(1).error_on(:start_at)
    end
  end
  describe 'end_at' do
    it "is invalid when blank" do
      event = Event.new end_at: ""
      expect(event).to have(1).error_on(:end_at)
    end
  end
  describe "end_at" do
    it "is invalid when end_at is before start_at" do
       event = Event.new end_at: Date.today, start_at: Date.today + 1.days
       expect(event).to have(1).error_on(:end_at)
    end
  end
  describe 'for_today' do
    
    it "returns an event that starts today" do
      event = FactoryGirl.create(:event, start_at: Date.today)
      expect(Event.for_today).to include(event)
    end
    it "doesnt return an event that start tomorrow" do
      event = FactoryGirl.create(:event, start_at: 1.day.from_now)
#      expect(Event.for_today).to eq([])
#      expect(Event.for_today).to be_empty
      expect(Event.for_today).not_to include(event)
    end
    it "does not return an event that has started" do
      event = FactoryGirl.create(:event, start_at: 1.day.ago)
      expect(Event.for_today).not_to include(event)
    end
  end

end

