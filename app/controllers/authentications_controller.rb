class AuthenticationsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:set_email]

  def create
    auth = request.env["omniauth.auth"]
    # Try to find authentication first
    authentication = Authentication.find_by_provider_and_uid(auth['provider'], auth['uid'])
    #request.original_url
    if authentication
      # Authentication found, sign the user in.
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, authentication.user)
    else
      ####### For auto generate 20 char code
      o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
      string = (0...20).map{ o[rand(o.length)] }.join
      ##########################################
      email = auth['extra']['raw_info']['email']
      puts email
      @user = User.find_by_email(email)#User.where(email: email1)
      if @user.nil?
        user = User.new
        user.apply_omniauth(auth)
        if email.nil?
          user.email = string+"@example.com"
        end
        if user.save(:validate => false)
          flash[:notice] = "Account created and signed in successfully."
          sign_in_and_redirect(:user, user)
        else
          flash[:error] = "Error while creating a user account. Please try again."
          redirect_to root_url
        end
      else
        @user.authentications.create(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
        flash[:notice] = "Account created and signed in successfully."
        sign_in_and_redirect(:user, @user)
      end
    end
  end

end
