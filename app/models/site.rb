class Site < ActiveRecord::Base
  attr_accessible :title, :domain,:user_id
  validates :title, presence:true,length:{maximum:20}
  validates :domain,presence:true,uniqueness:{case_sensitive: false}
  validates :user_id,presence:true
end
