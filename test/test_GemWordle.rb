# frozen_string_literal: false

# require "test_helper"
require "minitest/autorun"
require "minitest/spec"
require "GemWordle"

class TestGemWordle < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::GemWordle::VERSION
  end

  def test_charcolorize
    assert_equal GemWordle.charcolorize("a","0"), "\e[37ma\e[0m", "char colorize problem"
    assert_equal GemWordle.charcolorize("f","1"), "\e[33mf\e[0m", "char colorize problem"
    assert_equal GemWordle.charcolorize("v","2"), "\e[32mv\e[0m", "char colorize problem"
  end

  def test_paint
    ex1 = "ab0ty1"
    str = GemWordle.paint(ex1)
    assert_equal str, "\e[33my\e[0m","paint problem"

    ex2 = "aa"
    str = GemWordle.paint(ex2)
    assert_equal str, "", "paint problem"

    ex3 = "a1b223"
    str = GemWordle.paint(ex3)
    assert_equal str, "\e[33ma\e[0m\e[32mb\e[0m", "paint problem"
  end

  def test_string_compare
    str = GemWordle.string_compare("капля","цапля")
    assert_equal str , "к0а2п2л2я2\n0", "string comparsion problem"
    str = GemWordle.string_compare("окно","яблоко")
    assert_equal str , "", "string comparsion problem"
    str = GemWordle.string_compare("каша","анша")
    assert_equal str , "к0а1ш2а2\n0", "string comparsion problem"
  end
end
