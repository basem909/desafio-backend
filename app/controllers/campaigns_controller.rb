class CampaignsController < ApplicationController

  def find_last_completed_campaign
    # Get the last completed state on Campaign_State table
    @last_completed = Campaign.find_last_completed_campaign
    
    render json: @last_completed
  end

  def list_campaigns_by_state
    @current_list = Campaign.list_campaigns_by_state(campaign_params['state'])
    render json: @current_list
  end

  def total_campaigns_by_state
    @total = Campaign.total_campaigns_by_state
    render json: @total
  end

  private
  def campaign_params
    params.permit(:state)
  end
end
