class PetSitter < ApplicationRecord
    validates_presence_of :name, :description, :email, :cost

    def self.search(search)
        if search
            sitter = PetSitter.find_by(name: search)
            if sitter
                self.where(name: sitter.name)
            else
                @sitters = PetSitter.all
            end
        else
            @sitters = PetSitter.all
        end
    end
end
