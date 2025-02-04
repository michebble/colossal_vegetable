# frozen_string_literal: true

# rbs_inline: enabled
require "json"
require_relative "options"
module ColossalVegetable
  class CLI
    # @rbs argv: Array[String]
    # @rbs return: void
    def run(argv = ARGV)
      options = Options.new.parse(argv)
      load_data(options[:filepath])
      results = []
      case argv
      in ["search", String=>query]
        results = search(query)
      in ["duplicates"]
        results = duplicates
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

    attr_reader :config #: { filepath: String }
    attr_reader :data #: Array[{id: Integer, full_name: String, email: String}]

    # @rbs query: String
    # @rbs return: Array[{ id: Integer, full_name: String, email: String }]
    def search(query = "")
      data.select do |row|
        row[:full_name].downcase.include?(query.downcase)
      end
    end

    # @rbs return: Array[{ id: Integer, full_name: String, email: String }]
    def duplicates
      data
        .group_by { |row| row[:email] }
        .select { |_email, items| items.size > 1 }
        .values
        .flatten
    end

    # @rbs filepath: String
    # @rbs return: void
    def load_data(filepath)
      @data = JSON.parse(File.read(filepath), symbolize_names: true)
    end
  end
end
