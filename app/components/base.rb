# frozen_string_literal: true

class Components::Base < Phlex::HTML
  # Include any helpers you want to be available across all components
  include Phlex::Rails::Helpers::Routes

  if Rails.env.development?
    def before_template
      comment { "<#{self.class.name}>".html_safe }
      super
    end

    def after_template
      super
      comment { "</#{self.class.name}>".html_safe }
    end
  end
end
