class Board < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 1000 }
  validates :author_name, presence: true, length: { maximum: 20 }
end
