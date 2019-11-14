class CreateEmailSents < ActiveRecord::Migration[5.2]
  def change
    create_table :email_sents do |t|
      t.string :targets
      t.references :template, foreign_key: true
      t.timestamps
    end
  end
end
