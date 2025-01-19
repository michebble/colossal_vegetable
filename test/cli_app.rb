# frozen_string_literal: true

require "minitest/autorun"
require_relative "../lib/cli_app"

class CLIAppTest < Minitest::Test
  def test_search_integration
    std, err = capture_io { CLIApp.new(argv: ["search", "john"]).run }
    assert_empty(err)
    assert_match("search john", std)
  end
end
