class CreateSpaceships < ActiveRecord::Migration[7.1]
  def change
    create_table :spaceships do |t|
      t.string :name
      t.string :location
      t.integer :rating
      t.float :cost
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
