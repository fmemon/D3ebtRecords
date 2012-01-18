class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :cost
      t.integer :stock

      t.timestamps
    end
    
    Product.create :name => "test product 1", :description => "test description 1",  :cost => 1.11, :stock => 10
    Product.create :name => "test product 2", :description => "test description 2",  :cost => 2.22, :stock => 22
    
  end
end
