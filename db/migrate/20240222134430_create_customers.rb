class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :string,                  null: false
      t.integer :prefecture_id,          null: false
      t.string :city,                    null: false
      t.string :street_address,          null: false
      t.string :building_name
      t.string :phone_number,            null: false
      t.references :purchase,            null: false, foreign_key: true

      t.timestamps
    end
  end
end
