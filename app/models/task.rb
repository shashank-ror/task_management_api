class Task < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true
  validates :due_date, presence: true
  #validate :due_date_cannot_be_in_the_past
  #validates :status, inclusion: { in: %w(created assigned in_progress completed) }
  #validates :priority, inclusion: { in: %w(high medium low) }
  belongs_to :user, optional: true




  private

  def due_date_cannot_be_in_the_past
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "can't be in the past. Enter future date")
    end
  end

end
