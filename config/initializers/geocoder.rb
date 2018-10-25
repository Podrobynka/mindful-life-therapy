Geocoder.configure(
  timeout: 10,
  lookup: :google,
  use_https: true,
  api_key: Rails.application.credentials.dig(:geocoder, :google_api_key)
)
