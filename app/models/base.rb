class Base < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :base_number, presence: true, length: { in: 2..5 }, uniqueness: true
  validates :base_type, presence: true, length: { maximum: 30 }
end
