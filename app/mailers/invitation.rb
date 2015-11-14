class Invitation < ActionMailer::Base
  default from: "admin@ericandasmita.com"

  def rsvp_email(user)
    @user = user
    pub_private = Devise.token_generator.generate(User,:confirmation_token)
    @user.confirmation_token = pub_private[1]
    @user.confirmation_sent_at = DateTime.now
    @user.save

    @url = "http://#{ActionMailer::Base.default_url_options[:host]}/rsvp?token=#{pub_private[0]}"

    mail(to: @user.email, subject: 'You are invited')
  end
end