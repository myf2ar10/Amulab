class Contact < ApplicationRecord
  validates :email, presence: true
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :message, presence: true

end
