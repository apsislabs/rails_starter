# frozen_string_literal: true

Pagy::OPTIONS[:limit] = 10
Pagy::OPTIONS[:size] = 9
Pagy::OPTIONS[:page_param] = :page
Pagy::OPTIONS[:limit_param] = :per
Pagy::OPTIONS[:max_limit] = 500
Pagy::OPTIONS[:overflow] = :last_page

Pagy::OPTIONS.freeze
