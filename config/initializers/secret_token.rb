# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Capistrano::Application.config.secret_key_base = '2317cd5cda85e6fe2515c6a5aa5561bd8d6fd13ffa98afa591c6410b5fe882a07043de75c54a375331905a2e13dc27e863dbf5b7c8bbbfa1e21a9abd50831855'
