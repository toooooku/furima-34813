class Item < ApplicationRecord
  belongs_to :user
  belongs_to :destination

end
