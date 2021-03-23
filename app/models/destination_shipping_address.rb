class DestinationShippingAddress
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :city, :adress, :building_name, :phone_number, :destination_id, :item_id, :user_id

  with_options presence: true do
    validates :user_id
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    destination = Destination.create(item_id: item_id, user_id: user_id)
    Shipping_address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, adress: adress, building_name: building_name, phone_number: phone_number, destination_id: destination_id)
  end  
end  