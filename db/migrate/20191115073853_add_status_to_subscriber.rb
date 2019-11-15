class AddStatusToSubscriber < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribers, :status, :string
  end
end
