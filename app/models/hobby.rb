class Hobby < ActiveRecord::Base
    belongs_to :user
    has_many :items
end
