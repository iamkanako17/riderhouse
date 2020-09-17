class Lodging < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :host_user
  has_many_attached :images

  validates :prefecture_id, numericality: { other_than: 0 }
  validates :price, presence: true, numericality: { with: /[0-9]/ }

  with_options presence: true do
    validates :lodge_name
    validates :price, inclusion: { in: 999..9_999_999 }
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :block_number
    validates :description
    validates :images
  end
end
