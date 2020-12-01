class Lesson < ApplicationRecord
  has_one :activity, as: :actionable
  has_one :category
  validates :category_id, presence: true

  has_one :user 
  validates :user_id, presence: true

  has_one :answer
end
