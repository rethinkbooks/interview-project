# Controller for handling OAuth callback requests.
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # Following the Devise/Omniauth convention an action is provided for each
  # OAuth provider. Since this app only allows sign in through GitHub only the
  # <tt>github</tt> method is present.
  #
  # This action will attempt to retrieve the user from the database or create
  # them if they don't exist. If the user is successfully retrieved or created
  # then the user is signed in and their OAuth token is added to the session
  # for use in later API calls made through the search service.
  def github
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication

      session[:github_oauth_token] = request.env['omniauth.auth'].credentials.token

      set_flash_message(:notice, :success, kind: 'GitHub') if is_navigational_format?
    else
      session['devise.github_data'] = request.env['omniauth.auth']

      redirect_to new_user_session_url
    end
  end
end
