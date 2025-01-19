# frozen_string_literal: true

require "minitest/autorun"
require_relative "../lib/cli_app"

class CLIAppTest < Minitest::Test
  def config
    { filepath: "test/fixtures/clients.json" }
  end

  def test_search
    std, err = capture_io { CLIApp.new(argv: ["search", "john"], config:).run }
    assert_empty(err)
    assert_match(
      '[{"id":1,"full_name":"John Doe","email":"john.doe@gmail.com"},{"id":3,"full_name":"Alex Johnson","email":"alex.johnson@hotmail.com"}]',
      std,
    )
  end

  def test_duplicate
    std, err = capture_io { CLIApp.new(argv: ["duplicates"], config:).run }
    assert_empty(err)
    assert_match(
      '[{"id":2,"full_name":"Jane Smith","email":"jane.smith@yahoo.com"},{"id":15,"full_name":"Another Jane Smith","email":"jane.smith@yahoo.com"}]',
      std,
    )
  end

  def test_search_no_query
    std, err = capture_io { CLIApp.new(argv: ["search"], config:).run }
    assert_empty(std)
    assert_match("Please provide a search query", err)
  end

  def test_unknown_command
    std, err = capture_io { CLIApp.new(argv: ["unknown"], config:).run }
    assert_empty(std)
    assert_match("Unknown command", err)
  end
end
