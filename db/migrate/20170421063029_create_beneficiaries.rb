class CreateBeneficiaries < ActiveRecord::Migration[5.0]
  def change
    create_table :beneficiaries do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :phone_1
      t.string :phone_2
      t.references :holder, foreign_key: true
      
      t.timestamps
    end
  end
end
