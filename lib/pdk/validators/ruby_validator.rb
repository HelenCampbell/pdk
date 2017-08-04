require 'pdk'
require 'pdk/cli/exec'
require 'pdk/validators/base_validator'
require 'pdk/validators/ruby/rubocop'

module PDK
  module Validate
    class RubyValidator < BaseValidator
      def self.name
        'ruby'
      end

      def self.ruby_validators
        [Rubocop]
      end

      def self.invoke(*args)
        exit_code = 0

        ruby_validators.each do |validator|
          exit_code = validator.invoke(*args)
          break if exit_code != 0
        end

        exit_code
      end
    end
  end
end
