class GreetingRecipient < ActiveRecord::Base
  belongs_to :greeting
  has_many :greeting_schedules, :dependent => :destroy

  # accepts_nested_attributes_for :greeting_schedules, :allow_destroy => :true,
  #       :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
