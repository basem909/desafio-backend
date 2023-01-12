class Campaign < ApplicationRecord
  has_many :campaign_states

  def self.find_last_completed_campaign
        last_completed = self.joins(:campaign_states).where(campaign_states: {state: :completed}).last
        last_completed
    
  end

  def self.list_campaigns_by_state(state)
    current_list = []
    list = self.joins(:campaign_states).where(campaign_states: {state: state})
    list.each do |camp|
      current_list << camp.name if camp.campaign_states.last.state == state.to_s
    end
    current_list
  end

  def self.total_campaigns_by_state
    total = []
    states = [ :draft, :scheduled, :processing, :sending, :completed, :error ]
    states.each do |state|
      total << {campaigns: list_campaigns_by_state(state).length, state: state}
    end
    total
  end
end