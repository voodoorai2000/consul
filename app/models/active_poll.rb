class ActivePoll < ApplicationRecord
  include Measurable
  extend Mobility

  translates :description, touch: true

  accepts_nested_attributes_for :translations, allow_destroy: true
  include Globalizable
end
