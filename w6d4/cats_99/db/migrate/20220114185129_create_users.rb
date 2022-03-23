class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :string
      t.string :password_digest
      t.string :string
      t.string :session_token
      t.string :string

      t.timestamps
    end
  end
end
