class CreateAlums < ActiveRecord::Migration
  def change
    create_table :alums do |t|
      t.string :username, null:false
      t.string :email, null:false
      t.string :first_name
      t.string :last_name
      t.integer :grad_yr, null:false
      t.string :session_token, null:false
      t.string :password_digest, null:false
      t.timestamps null: false
    end
  end
end
