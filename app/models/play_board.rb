class PlayBoard < ActiveRecord::Base

  include Boardable

  belongs_to :play

end
