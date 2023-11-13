class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :favorites, dependent: :destroy
  has_many :favorited_items, through: :favorites, source: :item
  has_many :item_comments, dependent: :destroy
  has_many :item_commented_items, through: :item_comments, source: :item

  validates :name, presence: true
  validates :phone_number, presence: true, format: { with: /\A0\d{9,10}\z/ }  # 正規表現、ハイフンなし、0から、9～10桁
  validates :email, presence: true, format: { with: /\A[a-zA-Z0-9_+-]+(\.[a-zA-Z0-9_+-]+)*@([a-zA-Z0-9][a-zA-Z0-9-]*[a-zA-Z0-9]*\.)+[a-zA-Z]{2,}\z/ }  # 正規表現、ローカル@ドメイン、ドット連続不可


  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.phone_number = "00000000000"
      user.name = "guestuser"
    end
  end

  def guest_user?
    email == GUEST_USER_EMAIL
  end

end
