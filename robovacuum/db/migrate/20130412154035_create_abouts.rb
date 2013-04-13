class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.text :profile
      t.text :vision
      t.text :location
      t.timestamps
    end
  end
end
