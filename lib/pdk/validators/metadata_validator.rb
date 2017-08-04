require 'pdk'
require 'pdk/cli/exec'
require 'pdk/validators/base_validator'
require 'pdk/validators/metadata/metadata_json_lint'
require 'pdk/validators/metadata/metadata_syntax'

module PDK
  module Validate
    class MetadataValidator < BaseValidator
      def self.name
        'metadata'
      end

      def self.metadata_validators
        [MetadataSyntax, MetadataJSONLint]
      end

      def self.invoke(*args)
        exit_code = 0

        metadata_validators.each do |validator|
          exit_code = validator.invoke(*args)
          break if exit_code != 0
        end

        exit_code
      end
    end
  end
end
