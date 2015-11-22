class Play < ActiveRecord::Base

  belongs_to :game_board
  has_many :play_boards

  validates :value, numericality: {only_integer: true}, presence: true

end
