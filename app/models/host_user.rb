class HostUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # has_one :inn_description
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :hostname
  end
  
  with_options presence: true, format: { with: /\A[ア-ヶ一ー]+\z/ } do
    validates :hostname_kana
  end
  
  with_options presence: true do
    validates :nickname
    validates :phone, format: { with: /[0-9]{6,11}/ }, length: { maximum: 11 }
    validates :age
    validates :gender
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/ }
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, presence: true, format: PASSWORD_REGEX, length: { minimum: 6 }
end
