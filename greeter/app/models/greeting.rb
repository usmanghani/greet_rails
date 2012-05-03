class Greeting < ActiveRecord::Base
  has_many :greeting_recipients, :dependent => :destroy
  belongs_to :User

  accepts_nested_attributes_for :greeting_recipients, :allow_destroy => :true
         #, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  #scope :find_for_user, lambda { |id, user_id| Greeting.find(id, :conditions => ['users_id = ?', user_id])}

  def self.find_for_user(id, user_id)
    Greeting.find(id, :conditions => ['users_id = ?', user_id])
  end
 
  def self.find_all_for_user(user_id)
     Greeting.all(:conditions => ['users_id = ?', user_id])
  end
  
end
