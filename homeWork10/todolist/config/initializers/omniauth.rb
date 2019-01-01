Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "google id", "google_key"
end
