class Lodging < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  geocoded_by :prefecture_city
  after_validation :geocode

  belongs_to :host_user
  has_many_attached :images

  def self.search(search)
    if search != ""
      Lodging.where('prefecture_city LIKE(?)', "%#{search}%")
    else
      Lodging.all
    end
  end
  
  validates :price, presence: true, numericality: { with: /[0-9]/ }

  with_options presence: true do
    validates :lodge_name
    validates :price, inclusion: { in: 999..9_999_999 }
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_city
    validates :block_number
    validates :description
    validates :images
  end
end
