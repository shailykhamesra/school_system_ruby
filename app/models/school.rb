class School < ApplicationRecord

  has_many :classrooms, dependent: :destroy
  has_many :teachers, dependent: :destroy
  validates :name, :address, :phone_no, :code, presence: true
  validates :phone_no, length: { in: 10..15 }, numericality: { only_integer: true }

end