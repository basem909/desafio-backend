class DesafioController < ApplicationController

  def find_last_completed_campaign
    # Get the last completed state on Campaign_State table
    @last_completed = CampaignState.where(state: :completed).last

    # Get the campaign object that turned to completed most recently
    @campaign = Campaign.where(id: @last_completed.campaign_id).first

    return @campaign
  end

  
end
