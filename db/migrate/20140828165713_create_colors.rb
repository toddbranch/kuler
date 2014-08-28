class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :hex_value
      t.integer :palette_id

      t.timestamps
    end
  end
end
