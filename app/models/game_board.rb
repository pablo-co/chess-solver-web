class GameBoard < ActiveRecord::Base

  include Boardable
  include AASM

  has_many :plays ,dependent: :destroy

  enum status: [:pending, :processing, :working, :done]

  after_create :create_works

  aasm column: :status, enum: true, whiny_transitions: false do
    state :pending, initial: true
    state :processing
    state :working
    state :done

    event :process do
      transitions from: :pending, to: :processing
    end

    event :work do
      transitions from: :processing, to: :working
    end

    event :finish do
      transitions from: :working, to: :done
    end
  end

  validates :name, length: {in: 2..256}, presence: true

  def completion
    @completion ||= completed_boards.to_f / (total_boards == 0 ? 1.0 : total_boards.to_f) * 100.0
  end

  def create_works
    Resque.enqueue(WorkCreatorWorker, self.id)
  end

end
