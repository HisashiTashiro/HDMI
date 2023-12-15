class HashtagPost < ApplicationRecord
  belongs_to :combination
  belongs_to :hashtag
  validates :combination_id, presence: true
  validates :hashtag_id, presence: true
end
