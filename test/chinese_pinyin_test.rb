# -*- encoding : utf-8 -*-
require File.expand_path(File.join(File.dirname(__FILE__), 'test_helper'))

ENV["WORDS_FILE"] = File.dirname(__FILE__) + '/Words.dat'

class PinyinTest < Test::Unit::TestCase
  def test_t
    assert_equal("zhong guo", Pinyin.t('中国'))
    assert_equal("zhong guo english ri", Pinyin.t('中国english日'))
  end

  def test_t_with_splitter
    assert_equal("zhong-guo", Pinyin.t('中国', splitter: '-'))
    assert_equal("huangzhimin", Pinyin.t('黄志敏', splitter: ''))
    assert_equal("guang-zhou", Pinyin.t('广州', splitter: '-'))
  end

  def test_t_with_tone
    assert_equal("zhong1 guo2", Pinyin.t('中国', tone: true))
    assert_equal("huang2 zhi4 min3", Pinyin.t('黄志敏', tone: true))
  end
end
