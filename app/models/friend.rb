class Friend < ActiveRecord::Base
    has_many :user
    is_impressionable
end
