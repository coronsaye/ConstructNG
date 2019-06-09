class Individual < ApplicationRecord
  belongs_to :occupation
  belongs_to :user
  belongs_to :country
  belongs_to :state
end
