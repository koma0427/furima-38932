class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

    # テーブルとのアソシエーション
    has_many :reviews, dependent: :destroy 
    belongs_to :user
    has_one_attached :image
      # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_burden
  belongs_to :prefecture
  belongs_to :delivery_time


    # #空の投稿を保存できないようにする
    with_options presence: true do
      validates :user_id
      validates :image
      validates :name
      validates :product_description
      validates :category_id
      validates :status_id
      validates :delivery_burden_id
      validates :prefecture_id
      validates :delivery_time_id
        # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
      validates :selling_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    end
    
    #ジャンルの選択が「---」の時は保存できないようにする
    validates :category_id, :status_id, :delivery_burden_id, :prefecture_id, :delivery_time_id, numericality: { other_than: 1, message: "can't be blank" }
end
