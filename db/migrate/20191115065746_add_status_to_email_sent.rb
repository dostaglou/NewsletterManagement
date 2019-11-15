class AddStatusToEmailSent < ActiveRecord::Migration[5.2]
  def change
    add_column :email_sents, :status, :string
  end
end
