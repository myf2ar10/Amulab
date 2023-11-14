class Contact < ApplicationRecord

  validates :email, presence: true, format: { with: /\A[a-zA-Z0-9_+-]+(\.[a-zA-Z0-9_+-]+)*@([a-zA-Z0-9][a-zA-Z0-9-]*[a-zA-Z0-9]*\.)+[a-zA-Z]{2,}\z/ }  # 正規表現、ローカル@ドメイン、ドット連続不可
  validates :name, presence: true
  validates :phone_number, presence: true, format: { with: /\A0\d{9,10}\z/ }  # 正規表現、ハイフンなし、0から、9～10桁
  validates :message, length: { maximum: 2000 }

end