class List < ApplicationRecord
	has_many :item, dependent: :destroy
end
