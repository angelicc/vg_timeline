# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
<<<<<<< HEAD
  :key    => '_vg_timeline_session',
  :secret => '9d2f7dfc2e56ddc19573c86dae750fda3639a2b6a4f31d08beea564c578affb167e8755728fdede27695c5b58f656a3600f419510ed0706689a73361cc49d4c7'
=======
  :key         => '_vg_timeline_session',
  :secret      => 'd98d4c39604bff0d18ce06f8709323ee60f1dedc6be6b5c57af6b5f90d69943e3fb020e86e9953807dbbc56d5c53dd2173ddcb2eef5955006c4164b79ed64a87'
>>>>>>> 1a2077b7618653b1f5191387be40b27de1a3d757
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
