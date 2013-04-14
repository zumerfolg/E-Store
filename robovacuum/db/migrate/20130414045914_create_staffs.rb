class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
