# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile admin assets.
Rails.application.config.assets.precompile += %w[application.sass]
Rails.application.config.assets.precompile += %w[admin.js]
Rails.application.config.assets.precompile += %w[adminlte.min.js]