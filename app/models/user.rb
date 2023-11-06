class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # belongs_to :user
  # has_many :favorites, dependent: :destroy

  validates :name, presence: true

  # def user_params
  #   params.require(:user).permit(:email, :name, :phone_number, :password, :password_confirmation)
  # end

end
