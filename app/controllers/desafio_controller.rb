class DesafioController < ApplicationController

  def find_last_completed_campaign
    @last_completed = CampaignState.where(state: :completed).last
    @campaign = Campaign.where(id: @last_completed.campaign_id)

    return @campaign
  end
end
