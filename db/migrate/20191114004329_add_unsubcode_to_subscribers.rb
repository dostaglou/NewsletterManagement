class AddUnsubcodeToSubscribers < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribers, :unsub_code, :string
  end
end
