class Bus < ApplicationRecord
  has_one_attached :bus_photo
  validate :avatar_size_validation

  private
    def avatar_size_validation
      if license_photo.byte_size < 2.megabytes
        errors.add(:bus_photo , message: "file size should be less than 2 MB")
      end
    end
  
end
