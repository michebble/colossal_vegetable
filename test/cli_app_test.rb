# frozen_string_literal: true

require "minitest/autorun"
require_relative "../lib/cli_app"
require "debug"

class CLIAppTest < Minitest::Test
  def test_search_integration
    std, err = capture_io { CLIApp.new(argv: ["search", "john"]).run }
    assert_empty(err)
    assert_match(
      '[{"id":1,"full_name":"John Doe","email":"john.doe@gmail.com"},{"id":3,"full_name":"Alex Johnson","email":"alex.johnson@hotmail.com"}]',
      std,
    )
  end

  def test_search_no_query
    std, err = capture_io { CLIApp.new(argv: ["search"]).run }
    assert_empty(std)
    assert_match("Please provide a search query", err)
  end

  def test_unknown_command
    std, err = capture_io { CLIApp.new(argv: ["unknown"]).run }
    assert_empty(std)
    assert_match("Unknown command", err)
  end
end
