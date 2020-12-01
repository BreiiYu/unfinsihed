class Choice < ApplicationRecord
    belongs_to :word
    default_scope -> { order ('choices DESC')}
    # validates :word_id, presence: true
end
