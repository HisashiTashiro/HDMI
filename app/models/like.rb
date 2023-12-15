class Like < ApplicationRecord
  belongs_to :combination
  belongs_to :user

  validates_uniqueness_of :combination_id, scope: :user_id
end
