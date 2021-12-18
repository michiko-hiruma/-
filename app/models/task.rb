class Task < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  
  belongs_to :user
  
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 10}
  validates :description, presence: true, length: { in: 5..300 }
end
