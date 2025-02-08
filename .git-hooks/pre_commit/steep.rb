# frozen_string_literal: true

module Overcommit
  module Hook
    module PreCommit
      class Steep < Base
        def run
          result = execute(["bundle", "exec", "steep", "check"], args: applicable_files)
          return :pass if result.success?

          [:fail, result.stderr]
        end
      end
    end
  end
end
