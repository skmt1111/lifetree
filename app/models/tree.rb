class Tree < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true, length: { in: 1..20}
  validates :content, length: { in: 1..100 }
  validates :special_date, presence: true

  default_scope { order(special_date: :desc) }
end
