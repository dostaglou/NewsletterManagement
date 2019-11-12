class CreateNewsletters < ActiveRecord::Migration[5.2]
  def change
    create_table :newsletters do |t|
      t.references :manager, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
