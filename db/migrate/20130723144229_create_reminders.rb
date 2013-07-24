class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.date :reminder

      t.timestamps
    end
  end
end
