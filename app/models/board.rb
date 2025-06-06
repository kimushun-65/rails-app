# == Schema Information
#
# Table name: boards
#
#  id          :integer          not null, primary key
#  title       :string(30)       not null
#  body        :text             not null
#  author_name :string(20)       not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Board < ApplicationRecord
  has_many :comments, dependent: :delete_all
  has_many :board_tag_relations, dependent: :delete_all
  has_many :tags, through: :board_tag_relations

  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 1000 }
  validates :author_name, presence: true, length: { maximum: 20 }
end
