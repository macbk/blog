class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :hashtags, dependent: :destroy
    accepts_nested_attributes_for :hashtags, reject_if: :all_blank, allow_destroy: true
    validates :title, presence: true, length: { maximum: 50 }
    validates :body, presence: true, length: { maximum: 300 }
end
