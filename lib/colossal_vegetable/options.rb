# frozen_string_literal: true

# rbs_inline: enabled
require "optparse"

module ColossalVegetable
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
        opts.banner = "Usage: bin/cli action [options]"

        add_input_option(opts)

        opts.on_tail("-h", "--help", "Show this message") do
          puts opts
          exit
        end
      end
    end

    def add_input_option(opts)
      opts.on("-i", "--input FILEPATH", String, "Path to JSON file") do |filepath|
        options[:filepath] = filepath
      end
    end
  end
end
