class DestinationShippingAddress
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :city, :adress, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :adress
    validates :token
  end
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    VALID_PHONE_REGEX = /\A\d{,11}\z/
    validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }

  def save
    destination = Destination.create(item_id: item_id, user_id: user_id)
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, adress: adress, building_name: building_name, phone_number: phone_number, destination_id: destination.id)
  end  
end  