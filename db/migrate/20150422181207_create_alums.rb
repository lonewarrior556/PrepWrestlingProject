class CreateAlums < ActiveRecord::Migration
  def change
    create_table :alums do |t|
      t.string :username, null:false
      t.string :email, null:false
      t.string :fname
      t.string :lname
      t.integer :grad_yr
      t.string :session_token, null:false
      t.string :password_digest, null:false
      t.timestamps null: false
    end
    add_index :alums, :username, unique: true
    add_index :alums, :email, unique: true
  end
end
