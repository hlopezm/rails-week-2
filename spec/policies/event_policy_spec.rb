require 'spec_helper'

describe EventPolicy do
  describe '#edit' do
    it 'can be edited if the user is the same' do
      event = FactoryGirl.create(:event)
      policy = EventPolicy.new(event.user, event)

      expect(policy.edit?).to eq(true)
    end

    it 'can not be edited if the user is diferent' do
      event = FactoryGirl.create(:event)

      policy = EventPolicy.new(User.new, event)

      expect(policy.edit?).to eq(false)
    end
  end
end
