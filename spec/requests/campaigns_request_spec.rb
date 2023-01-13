require 'rails_helper'

RSpec.describe Campaign, type: :request do
  context 'use get request last_completed to get the last completed campaign' do
    it 'is receiving an Ok response from the server' do
      get '/campaigns/last_completed'
      expect(response).to have_http_status(200)
    end

    it 'the response return the EA campaign as the last completed' do
      get '/campaigns/last_completed'
      expect(response.body).to include('Campaign EA')
    end
  end

  context 'use post request list_state to get current campaigns for the state' do
    it 'is receiving an Ok response from the server and return campaign F' do
      post '/campaigns/list_state?state=error'

      expect(response).to have_http_status(200)
      expect(response.body).to include('Campaign F')
    end

    it 'is receiving an Ok response from the server and return campaign A, AB, and AC' do
      post '/campaigns/list_state?state=draft'

      expect(response).to have_http_status(200)
      expect(response.body).to include("Campaign A","Campaign AB","Campaign AC")
    end

    it 'is receiving an Ok response from the server and return campaign B' do
      post '/campaigns/list_state?state=scheduled'

      expect(response).to have_http_status(200)
      expect(response.body).to include("Campaign B")
    end

    it 'is receiving an Ok response from the server and return campaign C and CA' do
      post '/campaigns/list_state?state=processing'

      expect(response).to have_http_status(200)
      expect(response.body).to include("Campaign C","Campaign CA")
    end

    it 'is receiving an Ok response from the server and return campaign D' do
      post '/campaigns/list_state?state=sending'

      expect(response).to have_http_status(200)
      expect(response.body).to include("Campaign D")
    end

    it 'is receiving an Ok response from the server and return campaign E and EA' do
      post '/campaigns/list_state?state=completed'

      expect(response).to have_http_status(200)
      expect(response.body).to include("Campaign E","Campaign EA")
    end
  end
  
  context 'use get request total_state to get the total state' do
    it 'is receiving an Ok response from the server' do
      get '/campaigns/total_state'
      expect(response).to have_http_status(200)
    end

    it 'the response return the list of each state and the current number of campaigns' do
      get '/campaigns/total_state'
      expect(response.body).to eq("[{\"campaigns\":3,\"state\":\"draft\"},{\"campaigns\":1,\"state\":\"scheduled\"},{\"campaigns\":2,\"state\":\"processing\"},{\"campaigns\":1,\"state\":\"sending\"},{\"campaigns\":2,\"state\":\"completed\"},{\"campaigns\":1,\"state\":\"error\"}]")
    end
  end
end
