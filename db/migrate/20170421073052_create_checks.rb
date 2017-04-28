class CreateChecks < ActiveRecord::Migration[5.0]
  def change
    create_table :checks do |t|
      t.string :number
      t.references :account, foreign_key: true
      t.references :beneficiary, foreign_key: true
      t.date :date_discount

      t.timestamps
    end
  end
end
