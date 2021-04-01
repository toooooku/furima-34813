class Item < ApplicationRecord
  belongs_to :user
  has_many :destinations
  has_many_attached :images
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :day

  with_options presence: true do
      validates :name
      validates :description
      validates :images
      validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input full-width characters."}
      validates :price, numericality: {greater_than: 299, less_than: 10000000, message: 'Out of setting range'}
  end
  with_options presence: true do
      validates :category_id, numericality: { other_than: 1 } 
      validates :status_id, numericality: { other_than: 1 } 
      validates :cost_id, numericality: { other_than: 1 } 
      validates :day_id, numericality: { other_than: 1 } 
      validates :prefecture_id, numericality: { other_than: 1 } 
  end 
end
