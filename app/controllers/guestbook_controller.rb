class GuestbookController < ApplicationController
  before_action :authenticate_user!, except: [:index, :create] 
  def index
    @guestbooks = Guestbook.order(created_at: :desc).where(approved: true)
  end

  def create
    user_id = current_user ? current_user.id : nil
  	from = params['guestbook-from-field']
  	text = params['guestbook-text-field']
  	gb = Guestbook.new(from: from, body: text, poster_id: user_id)

    if gb.save
      HTTParty.post('http://textbelt.com/text', 
                    body: { number: "8485256609",
                            message: "#{from} has posted a guestbook message. Please approve."
                          }.to_json,
                          headers: { 'Content-Type' => 'application/json'}
                   )
      flash[:notice] = "Message submitted. Pending approval."
      redirect_to :guestbook_index
    else
      flash[:error] = "Cannot post message."
      redirect_to :guestbook_index
    end
  end
end
