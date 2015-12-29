class GuestbookController < ApplicationController
  def index
    @guestbooks = Guestbook.all
  end

  def create
    user_id = current_user ? current_user.id : nil
  	from = params['guestbook-from-field']
  	text = params['guestbook-text-field']
  	gb = Guestbook.new(from: from, body: text, poster_id: user_id)

    if gb.save
      redirect_to :guestbook_index
    else
      falsh[:error] = "Cannot post message."
      redirect_to :guestbook_index
    end
  end
end
