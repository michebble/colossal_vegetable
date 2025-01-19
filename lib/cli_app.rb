# frozen_string_literal: true

# rbs_inline: enabled
require "json"
require "debug"

class CLIApp
  # @rbs argv: Array[String]
  # @rbs results: Array[{id: Integer, full_name: String, email: String}]
  # @rbs config: {filepath: String}
  # @rbs return: void
  def initialize(argv:, config:)
    @argv = argv
    @config = config
    @results = []
  end

  # @rbs return: void
  def run
    load_data
    case argv
    in ["search", String=>query] then search(query)
    in ["duplicates"] then duplicates
    in ["search"]
      $stderr.puts "Please provide a search query"
      return
    else
      $stderr.puts "Unknown command"
      return
    end
    $stdout.puts JSON.generate(results)
  end

  private

  attr_reader :argv #: Array[String]
  attr_reader :results #: Array[{id: Integer, full_name: String, email: String}]
  attr_reader :config #: { filepath: String }
  attr_reader :data #: Array[{id: Integer, full_name: String, email: String}]

  # @rbs query: String
  # @rbs return: Array[{ id: Integer, full_name: String, email: String }]
  def search(query = nil)
    @results = data.select do |row|
      row[:full_name].downcase.include?(query.downcase)
    end
  end

  # @rbs return: Array[{ id: Integer, full_name: String, email: String }]
  def duplicates
    @results = data
      .group_by { |row| row[:email] }
      .select { |_email, items| items.size > 1 }
      .values
      .flatten
  end

  # @rbs return: void
  def load_data
    @data = JSON.parse(File.read(config[:filepath]), symbolize_names: true)
  end
end
