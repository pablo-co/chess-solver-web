class Piece < ActiveRecord::Base

  attr_accessor :image

  belongs_to :board, polymorphic: true

  enum color: [:black, :white]
  enum kind: [:knight, :king, :queen, :rook, :bishop, :pawn]

  validates :x, numericality: {only_integer: true}, presence: true
  validates :y, numericality: {only_integer: true}, presence: true
  validates :kind, inclusion: {in: Piece.kinds.keys}, presence: true
  validates :color, inclusion: {in: Piece.colors.keys}, presence: true

end
