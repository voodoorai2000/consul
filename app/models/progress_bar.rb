class ProgressBar < ApplicationRecord
  extend Mobility

  self.inheritance_column = nil
  RANGE = 0..100

  enum kind: %i[primary secondary]

  belongs_to :progressable, polymorphic: true

  translates :title, touch: true

  accepts_nested_attributes_for :translations, allow_destroy: true
  include Globalizable

  #translation_class_delegate :primary?

  validates :progressable, presence: true
  validates :kind, presence: true,
            uniqueness: {
              scope: [:progressable_type, :progressable_id],
              conditions: -> { primary }
            }
  validates :percentage, presence: true, inclusion: RANGE, numericality: { only_integer: true }

  validates :title, presence: true, unless: :primary?
end
