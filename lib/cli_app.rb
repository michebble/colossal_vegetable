# frozen_string_literal: true

# rbs_inline: enabled

class CLIApp
  # @rbs argv: Array[String]
  # @rbs return: void
  def initialize(argv:)
    @argv = argv
  end

  # @rbs return: void
  def run
    puts argv.join(" ")
  end

  private

  attr_reader :argv #: Array[String]
end
