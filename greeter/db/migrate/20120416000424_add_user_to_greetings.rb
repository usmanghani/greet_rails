class AddUserToGreetings < ActiveRecord::Migration
  def change
    change_table :greetings do |t|
      t.references :users
    end
  end
end
