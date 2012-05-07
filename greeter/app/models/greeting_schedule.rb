class GreetingSchedule < ActiveRecord::Base
    belongs_to :GreetingRecipient, :class_name => "GreetingRecipient", :foreign_key => "GreetingRecipient_id"
end
