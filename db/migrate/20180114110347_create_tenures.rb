class CreateTenures < ActiveRecord::Migration[5.0]
  def change
    create_table :tenures do |t|
      t.references :bank, foreign_key: true
      t.integer :months
      t.float :rate
      t.float :minimum_amount

      t.timestamps
    end
  end
end
