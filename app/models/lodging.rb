class Lodging < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions


  belongs_to :host_user
  has_many_attached :images, dependent: :destoy

  validates :price, presence: true, numericality: { with: /[0-9]/ }

  with_options presence: true do
    validates :lodge_name
    validates :price, inclusion: { in: 999..9_999_999 }
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_city
    validates :block_number
    validates :phone, format: { with: /\A^0\d{1,3}-\d{1,4}-\d{4}$\z/ }
    validates :description
    validates :images
  end

  def self.search(search)
    if search != ""
      Lodging.where('prefecture_city LIKE(?)', "%#{search}%")
    else
      Lodging.all
    end
  end
end
