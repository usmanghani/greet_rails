class GreetingRecipient < ActiveRecord::Base
  belongs_to :greeting
  has_many :greeting_schedules, :dependent => :destroy
  validates_inclusion_of :recipient_type, :in => %w(Email Twitter Facebook)

  accepts_nested_attributes_for :greeting_schedules, :allow_destroy => :true,
         :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  RECIPIENT_TYPES = %w(Email Twitter Facebook)
  # def recipient_type
  #     RECIPIENT_TYPES[read_attribute(:recipient_type)]
  #   end
end
