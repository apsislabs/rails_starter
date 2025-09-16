module Components
  class Card < Components::Base
    def initialize(title:)
      @title = title
    end

    def view_template
      article(class: "card") do
        h2(class: "card-title") { @title }
        yield
      end
    end
  end
end
