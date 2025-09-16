Time::DATE_FORMATS[:month_and_year] = "%B %Y"
Time::DATE_FORMATS[:human] = "%m/%d/%Y %I:%M %p"
Time::DATE_FORMATS[:short_ordinal] = lambda { |time| time.strftime("%B #{time.day.ordinalize}") }
