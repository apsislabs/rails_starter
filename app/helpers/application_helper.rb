# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def parent_layout(layout)
    @view_flow.set(:layout, output_buffer)
    output = render(template: layout)
    self.output_buffer = ActionView::OutputBuffer.new(output)
  end


  def active_link_to(name = nil, options = nil, html_options = nil, &block)
    active_class = html_options[:active] || "active"
    html_options.delete(:active)
    html_options[:class] = "#{html_options[:class]} #{active_class}" if current_page?(options)

    block_given? ? link_to(options, html_options, &block) : link_to(name, options, html_options)
  end
end
