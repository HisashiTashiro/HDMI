class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :combinations, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_combinations, through: :likes, source: :combination
  has_many :comments, dependent: :destroy
  has_many :combinations, dependent: :destroy #追記 ユーザーが削除されたら、ツイートも削除されるようになります。すでに書いてある場合は追記しなくて大丈夫です。
  
  has_many :liked_users, through: :likes, source: :user
  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記

  def already_liked?(combination)
    self.likes.exists?(combination_id: combination.id)
  end

end

