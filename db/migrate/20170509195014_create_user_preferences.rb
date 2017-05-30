class CreateUserPreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :user_preferences do |t|
      t.references :user, foreign_key: true

      t.string :email_type
      t.string :address
      t.string :port
      t.string :domain
      t.string :user_name
      t.string :password
      t.string :authentication
      t.string :enable_starttls_auto
      

    end
  end
end
