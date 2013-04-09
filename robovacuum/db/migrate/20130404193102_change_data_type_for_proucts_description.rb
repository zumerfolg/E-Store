class ChangeDataTypeForProuctsDescription < ActiveRecord::Migration
  def up
    change_table :products do |t|
      t.change :description, :text
    end    
  end

  def down
    change_table :products do |t|
      t.change :description, :string
    end    
  end
end
