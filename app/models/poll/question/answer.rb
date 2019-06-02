class Poll::Question::Answer < ApplicationRecord
  include Galleryable
  include Documentable
  include Globalizable
  extend Mobility

  translates :title,       touch: true
  translates :description, touch: true

  documentable max_documents_allowed: 3,
               max_file_size: 3.megabytes,
               accepted_content_types: [ "application/pdf" ]
  accepts_nested_attributes_for :documents, allow_destroy: true

  belongs_to :question, class_name: "Poll::Question", foreign_key: "question_id"
  has_many :videos, class_name: "Poll::Question::Answer::Video"

  #validates_translation :title, presence: true
  validates :given_order, presence: true, uniqueness: { scope: :question_id }

  def description
    self[:description].try :html_safe
  end

  def self.order_answers(ordered_array)
    ordered_array.each_with_index do |answer_id, order|
      find(answer_id).update_attribute(:given_order, (order + 1))
    end
  end

  def self.last_position(question_id)
    where(question_id: question_id).maximum("given_order") || 0
  end

  def total_votes
    Poll::Answer.where(question_id: question, answer: title).count +
      ::Poll::PartialResult.where(question: question).where(answer: title).sum(:amount)
  end

  def total_votes_percentage
    question.answers_total_votes.zero? ? 0 : (total_votes * 100.0) / question.answers_total_votes
  end
end
