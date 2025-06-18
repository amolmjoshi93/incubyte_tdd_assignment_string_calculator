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
        validate_invalid_chars(numbers_str, delimiter)
      end
      process_numbers(numbers_str, delimiter)
    end

    def self.process_numbers(numbers_str, delimiter)
      numbers_array = numbers_str.split(/#{delimiter}|\n/).map(&:strip).map(&:to_i)
      negative_numbers = numbers_array.select(&:negative?)
      raise ArgumentError, "negative numbers not allowed #{negative_numbers.join(", ")}" if negative_numbers.any?

      numbers_array.sum
    end

    def self.validate_invalid_chars(numbers_str, delimiter)
      return if numbers_str.match?(/\A(#{Regexp.escape(delimiter)}|\n|\d)+\z/)

      raise ArgumentError,
            "Invalid characters found: Only digits, newline, and '#{delimiter}' allowed in custom mode"
    end
  end
end
