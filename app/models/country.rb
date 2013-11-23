class Country < ActiveRecord::Base
  has_many :users , through: :appointments
end
