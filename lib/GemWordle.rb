# frozen_string_literal: true

require_relative "GemWordle/version"
require "colorize"

module GemWordle
  class Error < StandardError; end
  def self.hello
    "hello"
  end

  def self.string_compare(user_word,system_word)
  if not (user_word.is_a?(String)) then
    return ""
  end
  if not (system_word.is_a?(String)) then
    return ""
  end
  user_word=user_word.downcase
  system_word=system_word.downcase
  res=""
  for i in 0..user_word.length-1 do
    res = res+user_word.slice(i)
    if (user_word.slice(i)===system_word.slice(i))
      res = res+'2'
      fl=false
    elsif (system_word.slice(i,system_word.length).index(user_word.slice(i)))
      res = res+'1'
      else res = res+'0'
    end
  end
  return res
end

    
  def self.charcolorize(char,code)
    case code
    when "2"
      char = "\e[32m" + char + "\e[0m"
    when "1"
      char = "\e[33m" + char + "\e[0m"
    when "0"
      char = "\e[37m" + char + "\e[0m"
    end
  end
  def self.paint(string)
    output = ""
    string.each_char.with_index do |char,i|
      next if i.even?
      output = output + charcolorize(string[i-1],char).to_s
    end
    return output
  end

end
  # Your code goes here...

