class CreateGreetings < ActiveRecord::Migration
  def change
    create_table :greetings do |t|
      t.text :text, :null => false
      t.timestamps
    end
  end
end
