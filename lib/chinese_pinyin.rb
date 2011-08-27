# -*- encoding : utf-8 -*-
$KCODE = 'u' if RUBY_VERSION !~ /1\.9/

class Pinyin
  
  class <<self
    attr_accessor :table

    def init_table
      return if @table
      @table = {}
      open(File.dirname(__FILE__) + '/../data/Mandarin.dat') do |file|
        while line = file.gets
          key, value = line.split(' ', 2)
          @table[key] = value
        end
      end
    end

    def translate(chars, splitter = ' ')
      init_table
      results = []
      is_english = false
      chars.scan(/./).each do |char|
        key = sprintf("%X", char.unpack("U").first)
        if @table[key]
          results << splitter if is_english
          results << @table[key].chomp.split(' ', 2)[0].slice(0..-2).downcase
          results << splitter
          is_english = false
        else
          results << char
          is_english = true
        end
      end
      results.join('').chomp(splitter)
    end

    alias_method :t, :translate
  end
end
