class Legislation::QuestionOption < ApplicationRecord
  include ActsAsParanoidAliases
  extend Mobility

  acts_as_paranoid column: :hidden_at

  translates :value, touch: true

  accepts_nested_attributes_for :translations, allow_destroy: true
  include Globalizable

  belongs_to :question, class_name: "Legislation::Question", foreign_key: "legislation_question_id", inverse_of: :question_options
  has_many :answers, class_name: "Legislation::Answer", foreign_key: "legislation_question_id", dependent: :destroy, inverse_of: :question

  validates :question, presence: true
  validates :value, presence: true
end
