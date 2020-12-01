class Answer < ApplicationRecord
    has_one :lessons
    validates :lesson_id, presence: true

    has_one :word
    validates :word_id, presence: true

    has_one :choice 
    validates :choice_id, presence: true
end
