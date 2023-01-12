class DesafioController < ApplicationController

  def find_last_completed_campaign
    # Get the last completed state on Campaign_State table
    @last_completed = Campaign.joins(:campaign_states).where(campaign_states: {state: :completed}).last
    
    @last_completed
  end

  def list_campaigns_by_state(state)
    @current_list = []
    @list = Campaign.joins(:campaign_states).where(campaign_states: {state: state})
    @list.each do |camp|
      @current_list << camp.name if camp.campaign_states.last.state == state.to_s
    end
    @current_list
  end

  def total_campaigns_by_state
    @total = []
    @states = [ :draft, :scheduled, :processing, :sending, :completed, :error ]
    @states.each do |state|
      @total << {state: state, campaigns: list_campaigns_by_state(state).length}
    end
    @total
  end
end
