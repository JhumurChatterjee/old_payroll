class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, limit: 250, null: false
      t.string :email, limit: 250, null: false
      t.string :password_digest, limit: 250, null: false
      t.references :organization, index: true, foreign_key: true
      t.boolean :admin, default: false
    end
  end
end
