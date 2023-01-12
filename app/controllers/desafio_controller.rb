class DesafioController < ApplicationController

  def find_last_completed_campaign
    # Get the last completed state on Campaign_State table
    @last_completed = Campaign.joins(:campaign_states).where(campaign_states: {state: :completed}).last
    
    render json: @last_completed
  end

  def list_campaigns_by_state(state)
   
  end

  def total_campaigns_by_state
    @total = []
    @states = [ :draft, :scheduled, :processing, :sending, :completed, :error ]
    @states.each do |state|
      @total << {campaigns: list_campaigns_by_state(state).length, state: state}
    end
    @total
  end
end
