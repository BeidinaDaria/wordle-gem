# frozen_string_literal: true

require_relative "GemWordle/version"

module GemWordle
  class Error < StandardError; end
  def self.hello
    "hello"
  end
  def string_compare(user_word,system_word)
  if not (user_word.is_a?(String)) then
    return false
  end
  if not (system_word.is_a?(String)) then
    return false
  end
  user_word=user_word.downcase
  system_word=system_word.downcase
  return (user_word===system_word)
end

end
