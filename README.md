# ChinesePinyin

[![Chinese Pinyin](https://github.com/flyerhzm/chinese_pinyin/actions/workflows/chinese_pinyin.yml/badge.svg)](https://github.com/flyerhzm/chinese_pinyin/actions/workflows/chinese_pinyin.yml)

Translate chinese hanzi to pinyin.

The dict is borrowed from <http://github.com/fayland/perl-lingua-han/tree/master/Lingua-Han-PinYin/>

## Install

```
gem install chinese_pinyin
```

or add in Gemfile.

```
gem 'chinese_pinyin'
```

## Usage

By CLI


```
$ ch2py -h
Usage: ch2py [opts]
    -c, --camelcase                  Camelcase of each word
    -i, --stdin                      Read from stdard input
    -t, --tone                       Show tone at end of word
    -m, --tonemarks                  Show tone at top of letter, this
would cover -t option
    -s, --splitter <splitter>        Splitter of each word, use a space
by default
    -v, --version                    Show version
    -h, --help                       Show this help

$ ch2py 中文
zhong wen
```

By code

```
require 'chinese_pinyin'

Pinyin.t('中国')  => "zhong guo"
Pinyin.t('你好world') => "ni hao world"
Pinyin.t('中国', splitter: '-') => "zhong-guo"
Pinyin.t('中国', splitter: '') => "zhongguo"
Pinyin.t('中国', tone: true) => "zhong1 guo2"
Pinyin.t('中国', tonemarks: true) => "zhōng guó"
Pinyin.t('北京') { |letters| letters[0].upcase } => 'BJ'
Pinyin.t('北京') { |letters, i| letters[0].upcase if i == 0 } => 'B'
```

## Polyphone Issue

use Words.dat to override default behavior.

by default

```
Pinyin.t('广州') => "yan zhou"
```

add file Words.dat

```
广州|guang3 zhou1
```

set `ENV['WORDS_FILE']` for Words.dat

```
ENV['WORDS_FILE'] = "Words.dat path"
Pinyin.t('广州') => "guang zhou"
```
