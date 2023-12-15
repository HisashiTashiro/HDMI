class Combination < ApplicationRecord

    belongs_to :user
    # 追記箇所
    has_many :hashtag_posts, dependent: :destroy
    has_many :hashtags, through: :hashtag_posts

    after_create do
        combination = Combination.find_by(id: id)
        
        hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
        hashtags.uniq.map do |hashtag|
            
            tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
            combination.hashtags << tag
        end
    end
        #更新アクション
    before_update do
        combination = Combination.find_by(id: id)
        combination.hashtags.clear
        hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
        hashtags.uniq.map do |hashtag|
            tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
            combination.hashtags << tag
        end
    end
      has_many :likes, dependent: :destroy
      has_many :liked_users, through: :likes, source: :user
    # ここまで
      has_many :comments, dependent: :destroy
      mount_uploader :image, ImageUploader
end
