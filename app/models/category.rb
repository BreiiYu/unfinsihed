class Category < ApplicationRecord
  has_many :words, dependent: :destroy
  # has_many :answers, dependent: :destroy
  has_many :lessons
end
