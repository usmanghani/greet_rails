class CreateGreetingRecipients < ActiveRecord::Migration
  def change
    create_table :greeting_recipients do |t|
      t.string :recipient, :null => false
      t.string :recipient_type, :null => false
      t.references :greeting

      t.timestamps
    end
    add_index :greeting_recipients, :greeting_id
  end
end
