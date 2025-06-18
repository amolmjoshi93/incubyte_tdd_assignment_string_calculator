# frozen_string_literal: true

module StringCalculator
  # This class is responsible for performing addition
  class Addition
    def self.perform(numbers_str)
      return 0 if numbers_str.nil? || numbers_str.strip.empty?

      delimiter = ','
      if numbers_str.start_with?('//')
        delimiter_str, numbers_str = numbers_str.split("\n", 2)
        delimiter = delimiter_str[2..]

        unless numbers_str.match?(/\A(#{Regexp.escape(delimiter)}|\n|\d)+\z/)
          raise ArgumentError, "Invalid characters found: Only digits, newline, and '#{delimiter}' allowed in custom mode"
        end
      end
      numbers_str.split(/#{delimiter}|\n/).map(&:strip).map(&:to_i).sum
    end
  end
end
