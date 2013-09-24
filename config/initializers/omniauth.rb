Rails.application.config.middleware.use OmniAuth::Builder do
  # The following is for facebook
  #provider :facebook, [APP ID], [SECRET KEY], {scope: 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
  provider :facebook, '352945301507273', '2a2a057c16a26568eac75ef19545b10d'#, {:scope => 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
  provider :github, 'e4201f81b6f217b2bc5f', '1312bf4932fd663962c3cfdddcd1ea31b488b8fe'
  provider :twitter, 'wkVORw88UFqcUOkdqRasCA', 'fh5fN7BYJYQJSBPMwsI3a4v0HqHW6EBQZQZpmc8Xc'
  provider :linkedin, 'I1w4MFgQu7IWcexY', '19279ee3-8fb4-405b-bb39-4f19b344a376'#, :scope => 'r_fullprofile r_emailaddress r_network'
  provider :google_oauth2, '895994529643-m30br5sejl7miam3qeu3jhuvbb4qi9md.apps.googleusercontent.com', 'IMowssQ-jLbyGgmbboFEXRn5'
  #provider :google_oauth2, ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"],
  #         {
  #             :name => "google",
  #             :scope => "userinfo.email, userinfo.profile, plus.me, http://gdata.youtube.com",
  #             :prompt => "select_account",
  #             :image_aspect_ratio => "square",
  #             :image_size => 50
  #         }
  #provider :google_oauth2, CLIENT_ID, CLIENT_SECRET, {
  #    access_type: 'offline',
  #    scope: 'userinfo.email,userinfo.profile,plus.me,https://www.googleapis.com/auth/plus.login',
  #    request_visible_actions: 'http://schemas.google.com/AddActivity',
  #    redirect_uri: 'http://localhost/auth/google_oauth2/callback'
  #}
  #provider :twitter, '', ''
  # If you want to also configure for additional login services, they would be configured here.
end