# frozen_string_literal: true

# rbs_inline: enabled
require "json"
require "debug"

class CLIApp
  # @rbs argv: Array[String]
  # @rbs results: Array[{id: Integer, full_name: String, email: String}]
  # @rbs return: void
  def initialize(argv:)
    @argv = argv
    @results = []
  end

  # @rbs return: void
  def run
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
  attr_reader :results #: Array[Hash[Symbol, String]]

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

  # @rbs return: Array[{ id: Integer, full_name: String, email: String }]
  def data
    [
      {
        "id": 1,
        "full_name": "John Doe",
        "email": "john.doe@gmail.com",
      },
      {
        "id": 2,
        "full_name": "Jane Smith",
        "email": "jane.smith@yahoo.com",
      },
      {
        "id": 3,
        "full_name": "Alex Johnson",
        "email": "alex.johnson@hotmail.com",
      },
      {
        "id": 4,
        "full_name": "Michael Williams",
        "email": "michael.williams@outlook.com",
      },
      {
        "id": 5,
        "full_name": "Emily Brown",
        "email": "emily.brown@aol.com",
      },
      {
        "id": 6,
        "full_name": "William Davis",
        "email": "william.davis@icloud.com",
      },
      {
        "id": 7,
        "full_name": "Olivia Miller",
        "email": "olivia.miller@protonmail.com",
      },
      {
        "id": 8,
        "full_name": "James Wilson",
        "email": "james.wilson@yandex.com",
      },
      {
        "id": 9,
        "full_name": "Ava Taylor",
        "email": "ava.taylor@mail.com",
      },
      {
        "id": 10,
        "full_name": "Michael Brown",
        "email": "michael.brown@inbox.com",
      },
      {
        "id": 11,
        "full_name": "Sophia Garcia",
        "email": "sophia.garcia@zoho.com",
      },
      {
        "id": 12,
        "full_name": "Emma Lopez",
        "email": "emma.lopez@protonmail.ch",
      },
      {
        "id": 13,
        "full_name": "Liam Martinez",
        "email": "liam.martinez@fastmail.fm",
      },
      {
        "id": 14,
        "full_name": "Isabella Rodriguez",
        "email": "isabella.rodriguez@me.com",
      },
      {
        "id": 15,
        "full_name": "Another Jane Smith",
        "email": "jane.smith@yahoo.com",
      },
    ]
  end
end
