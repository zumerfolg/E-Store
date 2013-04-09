class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :postal_code
      t.integer :province_id

      t.timestamps
    end
  end
end
