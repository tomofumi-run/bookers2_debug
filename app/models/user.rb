class User < ApplicationRecord
  include JpPrefecture
  jp_prefecture :prefecture_code
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books,dependent: :destroy
  attachment :profile_image

  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction, length: {maximum: 50}
  
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name)
  end
end
