class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 入力チェック（:nameカラムが「空である」場合はDBに保存しない）
  validates :name, presence: true
  #README!の記述どおりにアソシエーションを記述
  has_many :room_users
  has_many :rooms, through: :room_users
end
