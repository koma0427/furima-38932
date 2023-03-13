class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
    # has_many :items
    # has_many :purchases

    with_options presence: true do
        validates :nickname, presence: true
        validates :email, presence: true
        validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers' }
        validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/} 
        validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/}
        validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
        validates :first_name_kana,  format:{ with: /\A[ァ-ヶー－]+\z/ }
        validates :birth_date, presence: true
    end
end
