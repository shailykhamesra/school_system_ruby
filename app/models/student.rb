class Student < ApplicationRecord

  belongs_to :school
  belongs_to :classroom
  validates :classroom_id, :name, :address, :phone_no, :gender, presence: true
  validates :phone_no, length: { in: 10..15 }, numericality: { only_integer: true }
  validates :gender, inclusion: { in: %w[male female] }

end
