class AddUnsubDateColumnToSubscriber < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribers, :unsub_date, :date
  end
end
