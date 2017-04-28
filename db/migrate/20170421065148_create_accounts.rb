class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :number
      t.references :bank, foreign_key: true
      t.references :holder, foreign_key: true
      t.string :agency_code

      t.timestamps
    end
  end
end
