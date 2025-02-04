# frozen_string_literal: true

require "minitest/autorun"
require_relative "../../lib/colossal_vegetable/options"

class OptionsTest < Minitest::Test
  def test_parse
    options = ColossalVegetable::Options.new
    result = options.parse(["-i", "file.json"])
    assert_equal({ filepath: "file.json" }, result)
  end

  def test_parse_missing_input_value
    options = ColossalVegetable::Options.new

    assert_raises(OptionParser::MissingArgument) do
      options.parse(["-i"])
    end
  end
end
