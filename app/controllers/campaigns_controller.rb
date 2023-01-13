class CampaignsController < ApplicationController

  def last_completed
    # Get the last completed state on Campaign_State table
    @last_completed = Campaign.find_last_completed_campaign
    # Return the json reponse for the api request
    render json: @last_completed
  end

  def list_state
    # Run the model method with the param passed in the request
    @current_list = Campaign.list_campaigns_by_state(campaign_params['state'])
    # Return the json reponse for the api request
    render json: @current_list
  end

  def total_state
    # Call the model method to return the total for each state
    @total = Campaign.total_campaigns_by_state
    # Return the json reponse for the api request
    render json: @total
  end

  private

  def campaign_params
    # permit the param attr state
    params.permit(:state)
  end
end
