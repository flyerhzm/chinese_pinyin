# -*- encoding : utf-8 -*-

require File.expand_path(File.join(File.dirname(__FILE__), 'test_helper'))

ENV["WORDS_FILE"] = File.dirname(__FILE__) + '/Words.dat'

class PinyinTest < Test::Unit::TestCase
  def test_t
    assert_equal("zhong guo", Pinyin.t('中国'))
    assert_equal("zhong guo english ri", Pinyin.t('中国english日'))
    assert_equal("shang hai very good o ye", Pinyin.t('上海very good哦耶'))
  end

  def test_t_with_frozen_string
    assert_equal("zhong guo", Pinyin.t('中国'.freeze))
    assert_equal("shen zhen", Pinyin.t('深圳'.freeze))
  end

  def test_t_with_splitter
    assert_equal("zhong-guo", Pinyin.t('中国', splitter: '-'))
    assert_equal("huangzhimin", Pinyin.t('黄志敏', splitter: ''))
    assert_equal("guang-zhou", Pinyin.t('广州', splitter: '-'))
    assert_equal("shang-hai", Pinyin.t('上海', splitter: '-'))
  end

  def test_t_with_tone
    assert_equal("zhong1 guo2", Pinyin.t('中国', tone: true))
    assert_equal("huang2 zhi4 min3", Pinyin.t('黄志敏', tone: true))
    assert_equal("shang4 hai3", Pinyin.t('上海', tone: true))
  end

  def test_t_with_camelcase
    assert_equal("Zhong Guo", Pinyin.t('中国', camelcase: true))
    assert_equal("Huang Zhi Min", Pinyin.t('黄志敏', camelcase: true))
    assert_equal("Zhong1 Guo2", Pinyin.t('中国', camelcase: true, tone: true))
    assert_equal("Huang2 Zhi4 Min3", Pinyin.t('黄志敏', camelcase: true, tone: true))
    assert_equal("Zhong-Guo", Pinyin.t('中国', camelcase: true, splitter: '-'))
    assert_equal("HuangZhiMin", Pinyin.t('黄志敏', camelcase: true, splitter: ''))
    assert_equal("Guang-Zhou", Pinyin.t('广州', camelcase: true, splitter: '-'))
    assert_equal("Shang-Hai", Pinyin.t('上海', camelcase: true, splitter: '-'))
    assert_equal("Shang4-Hai3", Pinyin.t('上海', camelcase: true, tone:true, splitter: '-'))
  end

  def test_t_with_chinese_punctuation
    assert_equal("ce-shi-yi-xia-Think-diff", Pinyin.t('测试一下，Think diff', splitter: '-'))
  end

  def test_t_with_tonemarks
    assert_equal('zhōng guó', Pinyin.t('中国', tonemarks: true))
    assert_equal('běi jīng', Pinyin.t('北京', tonemarks: true))
  end

  def test_t_with_custom
    assert_equal('BJ', Pinyin.t('北京') { |letters| letters[0].upcase } )
    assert_equal('B', Pinyin.t('北京') { |letters, i| letters[0].upcase if i == 0 } )
  end
end
