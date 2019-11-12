class CreateSubscribers < ActiveRecord::Migration[5.2]
  def change
    create_table :subscribers do |t|
      t.string :fullname
      t.string :email
      t.references :newsletter, foreign_key: true

      t.timestamps
    end
  end
end
