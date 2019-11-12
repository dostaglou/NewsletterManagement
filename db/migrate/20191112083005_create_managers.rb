class CreateManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :managers do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.references :newsletter, foreign_key: true
      t.timestamps
    end
  end
end
