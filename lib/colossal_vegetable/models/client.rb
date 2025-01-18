# frozen_string_literal: true

# rbs_inline: enabled

module ColossalVegetable
  module Models
    class Client
      attr_reader :id #: Integer
      attr_reader :full_name #: String
      attr_reader :email #: String

      # @rbs id: Integer
      # @rbs full_name: String
      # @rbs email: String
      # @rbs return: void
      def initialize(id:, full_name:, email:)
        @id = id
        @full_name = full_name
        @email = email
      end
    end
  end
end
