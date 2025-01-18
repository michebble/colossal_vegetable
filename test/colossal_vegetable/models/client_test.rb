# frozen_string_literal: true

require "minitest/autorun"
require_relative "../../../lib/colossal_vegetable/models/client"

module ColossalVegetable
  module Models
    class ClientTest < Minitest::Test
      def test_initialize
        client = Client.new(id: 1, full_name: "John", email: "john@example.com")
        assert_equal(1, client.id)
        assert_equal("John", client.full_name)
        assert_equal("john@example.com", client.email)
      end
    end
  end
end
