class ResultWorker

  def perform(_id, meta, _payload, result)
    board = GameBoard.find(meta['id'])
    if result
      update_stats(board, result['stats'])
      add_moves(board, result['best_path'], result['heuristic'])
      board.update(completed_boards: board.completed_boards + 1)
    end
  end

  protected

  def add_value_to_field(object, field, value)
    object.send("#{field}=", (object.send(field) || 0) + value.to_i)
  end

  def update_stats(board, stats)
    return unless stats
    add_value_to_field(board, :draws, stats['draws'])
    add_value_to_field(board, :black_wins, stats['black_wins'])
    add_value_to_field(board, :white_wins, stats['white_wins'])
    board.save
  end

  def add_moves(board, best_path, heuristic)
    return unless best_path
    play = board.plays.create(value: heuristic)
    best_path.each do |path|
      play.play_boards.create(path)
    end
  end

end