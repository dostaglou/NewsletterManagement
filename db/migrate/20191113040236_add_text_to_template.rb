class AddTextToTemplate < ActiveRecord::Migration[5.2]
  def change
    add_column :templates, :content, :string
  end
end
