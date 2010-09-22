# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_redpen_session',
  :secret      => 'f4a74751dfe414d1e5386864291a8eea9d3f7fa4ae52f324ba45b194bec558e2d4523bea02bb6ff093ff04ea2fa242a72e8436dc94b2b2d0f331b073faefcd1c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
