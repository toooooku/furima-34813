class Item < ApplicationRecord
  belongs_to :user
  has_many :destinations
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :day

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :day_id
    validates :prefecture_id
    validates :image
    validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input full-width characters."}
    validates :price, numericality: {greater_than: 299, less_than: 10000000, message: 'Out of setting range'}
  end
end
