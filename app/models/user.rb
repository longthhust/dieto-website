class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :user_logs
  has_many :user_goals
  has_many :friends
  
  
  def status_with friend_id
    if friend = Friend.where(user_id: self.id, friend_id: friend_id).try(:first)
      if friend.accepted
        :be_accepted
      else
        :requested
      end
    elsif friend = Friend.where(user_id: friend_id, friend_id:self.id).try(:first)
      if friend.accepted
        :accepted
      else
        :be_requested
      end
    else
      :nothing
    end
  end
  
  def friends 
    Friend.where("user_id = ? or friend_id = ?", self.id, self.id)
  end
  
  def self.search_db(query)
    # where(:username, query) -> This would return an exact match of the query
    where("name LIKE ?", "%#{query}%") 
  end  
    
end



    