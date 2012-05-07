class CreateGreetingSchedules < ActiveRecord::Migration
  def change
    create_table :greeting_schedules do |t|
      t.datetime :when, :null => false
      t.integer :recurrence_count, :default => 1
      t.datetime :recurrence_end
      t.datetime :next_occurrence
      t.integer :greeting_recipient_id

      t.timestamps
    end
    add_index :greeting_schedules, :greeting_recipient_id
  end
end
