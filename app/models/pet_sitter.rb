class PetSitter < ApplicationRecord
    validates_presence_of :name, :description, :email, :cost
end
