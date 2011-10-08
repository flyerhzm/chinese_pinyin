# -*- encoding : utf-8 -*-
require 'test_helper'

ENV["WORDS_FILE"] = File.dirname(__FILE__) + '/Words.dat'

class PinyinTest < Test::Unit::TestCase
  def test_t
    assert_equal("zhong guo", Pinyin.t('中国'))
    assert_equal("zhong-guo", Pinyin.t('中国', '-'))

    assert_equal("huangzhimin", Pinyin.t('黄志敏', ''))

    assert_equal("zhong guo english ri", Pinyin.t('中国english日'))

    assert_equal("guang-zhou", Pinyin.t('广州', '-'))
  end
end
