class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dogsitting
  has_one :dogsitter, through: :dogsitting, source: :user
  validates :starts_at, :ends_at, :status, presence: true
  enum status: { pending: 0, accepted: 1, rejected: 2 }
  def pending?
    status == 'pending'
  end
end
