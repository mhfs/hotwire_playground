class CreateAnimals < ActiveRecord::Migration[8.0]
  def change
    create_table :animals do |t|
      t.integer :family
      t.string :name

      t.timestamps
    end
  end
end
