class Ticket < ApplicationRecord
  validates :name,:ticket_source,:ticket_destination,:ticket_date,presence:true

end
