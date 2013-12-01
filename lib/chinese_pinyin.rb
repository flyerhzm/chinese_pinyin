# coding: utf-8
$KCODE = 'u' if RUBY_VERSION =~ /1\.8/

require 'chinese_pinyin/version'

class Pinyin
  class <<self
    attr_accessor :table
    attr_accessor :ruby2

    def init_table
      return if @table

      # Ruby 2.0以后默认即为UTF-8编码，使用新的码表以提升效率
      @ruby2  = !!(RUBY_VERSION =~ /^2/)
      datfile = @ruby2 ? 'pinyin-utf8.dat' : 'Mandarin.dat'
      @table  = {}

      File.open(File.dirname(__FILE__) + "/../data/#{datfile}") do |file|
        while line = file.gets
          key, value  = line.split(' ', 2)
          @table[key] = value
        end
      end
    end

    def init_word_table
      return if @words_table

      @words_table = {}

      if ENV["WORDS_FILE"]
        File.open(ENV["WORDS_FILE"]) do |file|
          while line = file.gets
            key, value        = line.sub("\n", "").split('|', 2)
            @words_table[key] = value
          end
        end
      end
    end

    def translate(chars, options={})
      splitter = options.fetch(:splitter, ' ')
      tone     = options.fetch(:tone, false)
      camel    = options.fetch(:camelcase, false)

      init_word_table
      results = @words_table[chars]
      if results
        results = results.split
        results.map!(&:downcase)
        results.map!(&:capitalize) if camel
        results.map! { |x| (48..57).include?(x[-1].ord) ? x.chop! : x } unless tone

        return results.join(splitter)
      end

      init_table
      results    = []
      is_english = false

      chars.scan(/./).each do |char|
        key = @ruby2 ? char : sprintf("%X", char.unpack("U").first)

        if @table[key]
          results << splitter if is_english

          is_english = false
          pinyin     = @table[key].chomp.split(' ', 2)[0]

          pinyin.downcase! unless @ruby2
          pinyin.chop! unless tone
          pinyin.capitalize! if camel

          results << pinyin
          results << splitter
        else
          if char =~ /[a-zA-Z0-9]/
            results << char
          elsif results.last != splitter
            results << splitter
          else
          end
          is_english = true
        end
      end
      results.join('').chomp(splitter)
    end

    alias_method :t, :translate
  end
end
