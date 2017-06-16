class CreateUserPreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :user_preferences do |t|

      t.references :user, index:true, foreign_key: true

      t.integer :pagination_per_page, default: 15
      t.integer :check_value_featured_cents, default: 150000
      t.integer :check_date_near, default: 6

      t.string :email_type
      t.string :smtp_address
      t.string :smtp_port
      t.string :smtp_domain
      t.string :smtp_user
      t.string :smtp_password
      t.string :smtp_authentication
      t.string :smtp_enable_starttls_auto

    end
  end
end
