class AddStatusToTemplate < ActiveRecord::Migration[5.2]
  def change
    add_column :templates, :status, :string
  end
end
