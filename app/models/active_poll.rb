class ActivePoll < ApplicationRecord
  include Measurable
  include Globalizable
  extend Mobility

  translates :description, touch: true
end
