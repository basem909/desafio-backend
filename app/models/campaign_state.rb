class CampaignState < ApplicationRecord
  enum state: %i[draft scheduled processing sending completed error], _prefix: false, _scopes: false
  belongs_to :campaign
end
