class CreateTableOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name,  limit: 250, null: false
      t.string :email, limit: 250, null: false
      t.string :password, limit: 250
    end
  end
end
