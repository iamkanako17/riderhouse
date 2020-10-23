class CreateLodgings < ActiveRecord::Migration[6.0]
  def change
    create_table :lodgings do |t|
      t.string          :lodge_name,  null: false
      t.integer         :price,       null: false
      t.string          :postcode,    null: false
      t.string         :prefecture_city,  null: false
      t.string          :block_number, null: false
      t.string          :building
      t.string          :phone, null:false
      t.string          :description,  null: false
      t.integer         :host_user_id,   foreign_key: true
      t.timestamps
    end
  end
end
