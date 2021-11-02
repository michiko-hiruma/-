class Task < ApplicationRecord
    belongs_to :user
    validates :name, presence: true, length: { maximum: 100 }
    validates :detail, presence: true, length: { maximum: 200 }
end
