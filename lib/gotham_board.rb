require 'wonderland/board'
require 'yaml'

class GothamBoard
  def self.load_board(file_name)
    raw = YAML.load Pathname(file_name).read()
    Wonderland::Board.new(raw)
  end
end
