# frozen_string_literal: true

require "pagy/extras/limit"
require "pagy/extras/array"
require "pagy/extras/overflow"
require "pagy/extras/pagy"

Pagy::DEFAULT[:limit] = 10 # items per page
Pagy::DEFAULT[:size] = 9 # nav bar links
Pagy::DEFAULT[:page_param] = :page
Pagy::DEFAULT[:limit_param] = :per
Pagy::DEFAULT[:limit_max] = 500
Pagy::DEFAULT[:overflow] = :last_page

# When you are done setting your own default freeze it, so it will not get changed accidentally
Pagy::DEFAULT.freeze
