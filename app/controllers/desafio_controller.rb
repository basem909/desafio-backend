class DesafioController < ApplicationController

  def find_last_completed_campaign
    # Get the last completed state on Campaign_State table
    @last_completed = CampaignState.where(state: :completed).last

    # Get the campaign object that turned to completed most recently
    @campaign = Campaign.where(id: @last_completed.campaign_id).first

    return @campaign
  end

  def list_campaigns_by_state(state)
    @actual_list = []
    @list = Campaign.joins(:campaign_states).where(campaign_states: {state: state})
    p @list
    @list.each do |camp|
      @actual_list << camp if camp.campaign_states.last.state == state.to_s
    end
    @actual_list
  end

end
