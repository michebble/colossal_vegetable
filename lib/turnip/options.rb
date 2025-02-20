# frozen_string_literal: true

# rbs_inline: enabled
require "optparse"

module Turnip
  class Options
    # @rbs return: void
    def initialize
      @options = {}
    end

    # @rbs command_line_args: Array[String]
    # @rbs return: {filepath: String}
    def parse(command_line_args)
      define_options.parse!(command_line_args)
      @options
    end

    private

    attr_accessor :options #: {filepath: String}

    def define_options
      OptionParser.new do |opts|
        opts.banner = <<~BANNER
          Welcome to Colossal Vegetable!

          Usage:
            bin/cli [command] [options]

          Example:
            bin/cli search john -i clients.json

          Commands:
            search [query] - Search for a client by full_name
            duplicates - Find clients with duplicate emails

          Options:
        BANNER

        add_input_option(opts)

        opts.on_tail("-h", "--help", "Shows this message") do
          puts opts
          exit
        end
      end
    end

    def add_input_option(opts)
      opts.on("-iFILEPATH", "--input=FILEPATH", String, "Path to JSON file containing the records") do |filepath|
        options[:filepath] = filepath
      end
    end
  end
end
