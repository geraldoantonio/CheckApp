class AddAmountCentsToCheck < ActiveRecord::Migration[5.0]
  def change
    add_column :checks, :amount_cents, :integer, default: 0
  end
end
