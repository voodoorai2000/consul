class ActivePoll < ApplicationRecord
  include Measurable
  extend Mobility
  include Globalizable

  translates :description, touch: true

  accepts_nested_attributes_for :translations, allow_destroy: true
end
