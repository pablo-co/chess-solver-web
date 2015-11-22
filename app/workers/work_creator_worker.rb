class WorkCreatorWorker
  @queue = :work_creator

  def self.perform(board_id)
    ActiveRecord::Base.clear_active_connections!
    worker = WorkCreatorWorker.new
    worker.perform(board_id)
  end

  def perform(board_id)
    board = GameBoard.find(board_id)
    input = "#{Rails.root}/tmp/#{SecureRandom.hex}.json"
    output = "#{Rails.root}/tmp/#{SecureRandom.hex}.json"

    create_input(board, input)
    system("#{Settings.chess.path} -i #{input} -o #{output}")
    read_output(board, output)

    clean(input, output)
  end

  protected

  def create_input(board, input)
    File.open(input, 'w') do |f|
      f.write(
          board.to_json(
              only: [:turn],
              include: [
                  pieces: {
                      only: [:kind, :color, :x, :y]
                  }
              ]
          )
      )
    end
  end

  def read_output(board, output)
    work_boards = JSON.parse(File.read(output))['boards']
    work_boards.each do |work_board|
      puts work_board.inspect
      work_board['boards'] = work_board.delete('old_boards')
      SeaMule.enqueue(ResultWorker, work_board, {id: board.id})
    end
    board.update!(total_boards: work_boards.size)
  end

  def clean(input, output)
    File.delete(input)
    File.delete(output)
  end
end