OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['MM_FACEBOOK_APP_ID'], ENV['MM_FACEBOOK_APP_SECRET']
end