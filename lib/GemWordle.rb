# frozen_string_literal: true

require_relative "GemWordle/version"
require "colorize"

module GemWordle
  class Error < StandardError; end
  def self.hello
    "hello"
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

