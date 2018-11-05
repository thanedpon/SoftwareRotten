# Replace API_KEY and API_SECRET with the values you got from twitter

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, "324710944787205", "376adce5e45e0decf6928faa2ab6c94b"
end