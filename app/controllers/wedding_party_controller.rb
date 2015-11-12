class WeddingPartyController < ApplicationController
  def index
  	@wedding_party = WeddingPartyMember.alernating_party
  end
end
