class AddHeaderToTemplate < ActiveRecord::Migration[5.2]
  def change
    add_column :templates, :header, :string
  end
end
