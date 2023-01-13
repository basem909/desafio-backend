require 'rails_helper'

RSpec.describe Campaign, type: :model do
  context 'use self.find_last_completed_campaign to get the last completed campaign' do
    last_completed = Campaign.find_last_completed_campaign

    it 'Should return campain named EA' do
      expect(last_completed.name).to eq("Campaign EA")
    end

    it 'Should return campain named EA' do
      expect(last_completed.name).not_to eq("Campaign E")
    end

  end

  context 'use self.list_campaigns_by_state(state) to get the names of current campaign' do
    it 'Should return campain names A, AB and AC' do
      draft = Campaign.list_campaigns_by_state(:draft)
      expect(draft).to eq(["Campaign A","Campaign AB","Campaign AC"])
    end

    it 'Should return campain name B' do
      scheduled = Campaign.list_campaigns_by_state(:scheduled)
      expect(scheduled).to eq(["Campaign B"])
    end

    it 'Should return campain names C and CA' do
      processing = Campaign.list_campaigns_by_state(:processing)
      expect(processing).to eq(["Campaign C","Campaign CA"])
    end

    it 'Should return campain name D' do
      sending = Campaign.list_campaigns_by_state(:sending)
      expect(sending).to eq(["Campaign D"])
    end

    it 'Should return campain names E and EA' do
      completed = Campaign.list_campaigns_by_state(:completed)
      expect(completed).to eq(["Campaign E","Campaign EA"])
    end

    it 'Should return campain name F' do
      error = Campaign.list_campaigns_by_state(:error)
      expect(error).to eq(["Campaign F"])
    end
  end

  context 'use self.total_campaigns_by_state to get the total campaigns sorted by state' do
    total = Campaign.total_campaigns_by_state

    it 'Should return the total of the campaigns sorted by state' do
      expect(total).to eq([{:campaigns=>3, :state=>:draft},
        {:campaigns=>1, :state=>:scheduled},
        {:campaigns=>2, :state=>:processing},
        {:campaigns=>1, :state=>:sending},
        {:campaigns=>2, :state=>:completed},
        {:campaigns=>1, :state=>:error}])
    end

  end
end
