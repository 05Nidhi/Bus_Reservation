class Ticket < ApplicationRecord
  validates :name,:ticket_source,:ticket_destination,:ticket_date,presence:true
  validate :ticket_date_match
  def ticket_date_match
    if ticket_date.present? && ticket_date < Date.today
      errors.add(:ticket_date, "can't be in the past")
    end
  end
end
