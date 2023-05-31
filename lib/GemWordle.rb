# frozen_string_literal: true
# encoding: utf-8
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
require_relative "GemWordle/version"

module GemWordle
  class Error < StandardError; end

  def self.play

    path = "X:/home/Gem/GemWordle/lib/words.txt"
    file = File.new(path,"r:UTF-8")
    pull = file.readlines
    r = rand(0..pull.length-1)
    word = pull[r].gsub(/\s+/, "")
    puts "Угадайте " + word.length.to_s + "-буквенное слово: \n"
    attempts = word.length + 1
    temp = attempts
    i = 0
    puts "Попыток: "+temp.to_s+"\n"
    while true do
      puts "Ваше слово: "
      guess = gets.chomp.to_s
      str = string_compare(guess,word)
      if str != ""
        puts paint(str)
      else
        temp = temp + 1
        i = i - 1
      end
      max = 0
      str.each_char do |c|
        if c == '2'
          max = max + 1
        end
      end
      temp = temp - 1
      i = i + 1
      if temp == 0
        puts "Попыток осталось: \e[31m" + temp.to_s + "\e[0m. Ты проиграл("
        return
      end
      if max == word.length
        puts "Ответ получен.Ты молодец \nВыполнено за " + i.to_s + " попытки/ок\n"
        return
      else
        puts "Ответ не получен.Пробуй еще \nПопыток осталось: \e[31m" + temp.to_s + "\e[0m\n\n"
      end


    end
  end

  def self.string_compare(user_word,system_word)
    user_word.downcase!
    system_word.downcase!
    path = "X:/home/Gem/GemWordle/lib/words.txt"
    file = File.new(path,"r:UTF-8")
    pull = file.readlines
    user_word = user_word +"\n"

    if not(pull.include? user_word)
      puts "\e[3m\nПохоже, что такого слова нет....\e[23m"
      return ""
    end

    if user_word.length-1 != system_word.length
      puts "\e[3m\nУпс..Длина загаданного слова не совпадает с длиной вашего\e[23m"
      return ""
    end

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

