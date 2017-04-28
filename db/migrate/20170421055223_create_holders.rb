class CreateHolders < ActiveRecord::Migration[5.0]
  def change
    create_table :holders do |t|
      t.string :name
      t.string :cpf
      t.string :cnpj
      t.references :user, index:true, foreign_key: true

      t.timestamps
    end
  end
end
