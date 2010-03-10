# ChinesePinyin

Translate chinese hanzi to pinyin.

The dict is borrowed from http://github.com/fayland/perl-lingua-han/tree/master/Lingua-Han-PinYin/

## Install

<pre><code>sudo gem install chinese_pinyin</code></pre>

## Usage

<pre><code>
Pinyin.t('中国')  => "zhong guo"
Pinyin.t('中国', '-') => "zhong-guo"
Pinyin.t('中国', '') => "zhongguo"
Pinyin.t('你好world') => "ni hao world"
</code></pre>
