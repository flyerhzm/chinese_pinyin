# -*- encoding : utf-8 -*-
require 'test_helper'

class PinyinTest < Test::Unit::TestCase
  def test_t
    assert_equal("zhong guo", Pinyin.t('中国'))
    assert_equal("zhong-guo", Pinyin.t('中国', '-'))

    assert_equal("huangzhimin", Pinyin.t('黄志敏', ''))

    assert_equal("zhong guo english ri", Pinyin.t('中国english日'))
  end
end
