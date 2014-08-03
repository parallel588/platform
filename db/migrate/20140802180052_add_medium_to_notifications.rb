class AddMediumToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :medium, :string
  end
end
