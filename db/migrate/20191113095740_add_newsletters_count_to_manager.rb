class AddNewslettersCountToManager < ActiveRecord::Migration[5.2]
  def change
    add_column :managers, :newsletters_count, :integer
  end
end
