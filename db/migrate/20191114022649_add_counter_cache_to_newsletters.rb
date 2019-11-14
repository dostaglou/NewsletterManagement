class AddCounterCacheToNewsletters < ActiveRecord::Migration[5.2]
  def change
    add_column :newsletters, :subscribers_count, :integer
    add_column :newsletters, :templates_count, :integer
  end
end
