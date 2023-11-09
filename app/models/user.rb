class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  # belongs_to :user
  # has_many :favorites, dependent: :destroy
  has_many :item_comments, dependent: :destroy

  validates :name, presence: true

  # def user_params
  #   params.require(:user).permit(:email, :name, :phone_number, :password, :password_confirmation)
  # end


GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

end
