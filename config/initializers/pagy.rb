# frozen_string_literal: true

# Pagy initializer file (8.4.1)
# Pagy Variables
# See https://ddnexus.github.io/pagy/docs/api/pagy#variables
# You can set any pagy variable as a Pagy::DEFAULT. They can also be overridden per instance by just passing them to
# Pagy.new|Pagy::Countless.new|Pagy::Calendar::*.new or any of the #pagy* controller methods
# Here are the few that make more sense as DEFAULTs:
Pagy::DEFAULT[:items]       = 15                    # default
Pagy::DEFAULT[:size]        = [1,4,4,1]             # default in pagy < 7.0
Pagy::DEFAULT[:page_param]  = :page                 # default
# Pagy::DEFAULT[:count_args]  = []                    # example for non AR ORMs

# Frontend Extras

# Pagy extra: Add the pagy styled versions of the javascript-powered navs
# and a few other components to the Pagy::Frontend module.
# See https://ddnexus.github.io/pagy/docs/extras/pagy
require 'pagy/extras/pagy'

# Multi size var used by the *_nav_js helpers
# See https://ddnexus.github.io/pagy/docs/extras/pagy#steps
# Pagy::DEFAULT[:steps] = { 0 => [2,3,3,2], 540 => [3,5,5,3], 720 => [5,7,7,5] }   # example

# Items extra: Allow the client to request a custom number of items per page with an optional selector UI
# See https://ddnexus.github.io/pagy/docs/extras/items
# require 'pagy/extras/items'
# set to false only if you want to make :items_extra an opt-in variable
# Pagy::DEFAULT[:items_extra] = false    # default true
# Pagy::DEFAULT[:items_param] = :items   # default
# Pagy::DEFAULT[:max_items]   = 100      # default

require 'pagy/extras/trim'

# set to false only if you want to make :trim_extra an opt-in variable
# Pagy::DEFAULT[:trim_extra] = false # default true

# Rails
# Enable the .js file required by the helpers that use javascript
# (pagy*_nav_js, pagy*_combo_nav_js, and pagy_items_selector_js)
# See https://ddnexus.github.io/pagy/docs/api/javascript

# With the asset pipeline
# Sprockets need to look into the pagy javascripts dir, so add it to the assets paths
Rails.application.config.assets.paths << Pagy.root.join('javascripts')

# I18n

# Pagy internal I18n: ~18x faster using ~10x less memory than the i18n gem
# See https://ddnexus.github.io/pagy/docs/api/i18n

Pagy::I18n.load(locale: 'pt-BR')

# When you are done setting your own default freeze it, so it will not get changed accidentally
# Pagy::DEFAULT.freeze
