# frozen_string_literal: true

module StringCalculator
  class Addition
    def self.perform(numbers_str)
      return 0 if numbers_str.nil? || numbers_str.strip.empty?

      delimiter = ','
      # if numbers_str.starts_with?('//')
      numbers_str.split(/#{delimiter}|\n/).map(&:strip).map(&:to_i).sum
    end
  end
end
