module Boardable

  extend ActiveSupport::Concern

  included do
    has_many :pieces, as: :boardable, dependent: :destroy

    enum turn: [:blacks, :whites]

    accepts_nested_attributes_for :pieces, allow_destroy: true

    validates :turn, inclusion: {in: turns.keys}, presence: true
  end

end
