class Campaign < ApplicationRecord
  has_many :campaign_states

  def self.find_last_completed_campaign
        # Get the last completed state on Campaign_State table 
        # return the campaign
        last_completed = self.joins(:campaign_states).where(campaign_states: {state: :completed}).last
        last_completed
    
  end

  def self.list_campaigns_by_state(state)
    # Create an empty list to collect the current state campaigns
    current_list = []
    # Detect the campagins that has the passed state
    list = self.joins(:campaign_states).where(campaign_states: {state: state})
    list.each do |camp|
      # Take away the campaigns that proceeded to the next state
      current_list << camp.name if camp.campaign_states.last.state == state.to_s
    end
    # Return the current Campaigns in the targeted state
    current_list
  end

  def self.total_campaigns_by_state
    # Create an empty list to collect the total for each state
    total = []
    # List of each state in campaign states
    states = [ :draft, :scheduled, :processing, :sending, :completed, :error ]
    states.each do |state|
      # get the current total of each state and then add the object to the total
      total << {campaigns: list_campaigns_by_state(state).length, state: state}
    end
    # Return the current total grouped by state
    total
  end
end