# frozen_string_literal: true

require "test_helper"

class OptionsTest < Minitest::Test
  def test_parse
    options = Turnip::Options.new
    result = options.parse(["-i", "file.json"])
    assert_equal({ filepath: "file.json" }, result)
  end

  def test_parse_missing_input_value
    options = Turnip::Options.new

    assert_raises(OptionParser::MissingArgument) do
      options.parse(["-i"])
    end
  end
end
