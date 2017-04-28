class CreateBanks < ActiveRecord::Migration[5.0]
  def change
    create_table :banks do |t|
      t.string :bank_name

      t.timestamps
    end
  end
end
