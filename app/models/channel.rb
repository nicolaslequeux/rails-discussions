class Channel < ApplicationRecord

  has_many :discussions

  # this is how we create a jointable...
  has_many :users, through: :discussions

end
