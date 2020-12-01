class Word < ApplicationRecord
  belongs_to :category
  default_scope -> { order ('word DESC')}
  validates :category_id, presence: true

  has_many :choices, dependent: :destroy 
  accepts_nested_attributes_for :choices, reject_if: lambda { |a| a[:choices].blank? }, allow_destroy: true
  
  validate :rightchoice

  def rightchoice
    right = choices.select{ |choice| choice.correct }.length
    if right > 1
      return errors.add(:base)
    elsif right == 0
      return errors.add(:base)
    end
  end
  # hint: helper or a method
  # References
  # https://api.rubyonrails.org/classes/ActiveModel/Validations/ClassMethods.html#method-i-validate
  # https://guides.rubyonrails.org/v5.0/active_record_validations.html#errors-base
  # https://stackoverflow.com/questions/22626222/validate-that-at-least-one-check-box-is-selected-in-rails-non-habtm
  # https://guides.rubyonrails.org/active_record_validations.html#validations-overview-errors

  # has_many :answers, dependent: :destroy
end