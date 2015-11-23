class WeddingPartyController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
  	@wedding_party = WeddingPartyMember.alernating_party
  	@wedding_party_mobile = WeddingPartyMember.bride_then_groom
  end
end
