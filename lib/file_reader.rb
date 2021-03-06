require 'colorize'

class FileReader
  attr_reader :file_path, :file_data, :error_message

  def initialize(file_path)
    @file_path = file_path
    @error_message = []
    begin
      # rubocop:disable Security/Open
      @file_data = File.readlines(URI.open(@file_path))
      # rubocop:enable Security/Open
    rescue StandardError
      @file_data = nil
      @error_message << 'The passed file isn\'t working! Can you check the file name or path again?'
    end
  end
end
