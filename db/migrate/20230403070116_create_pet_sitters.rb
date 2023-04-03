class CreatePetSitters < ActiveRecord::Migration[6.1]
  def change
    create_table :pet_sitters do |t|
      t.string :name
      t.string :email
      t.text :description
      t.string :cost

      t.timestamps
    end
  end
end
