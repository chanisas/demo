require 'bigdecimal'

class Change
  def initialize(input)
    @input = input
    @notes = {
      'thousand_note' => BigDecimal.new('1000'),
      'five_hundred_note' => BigDecimal.new('500'),
      'hundred_note' => BigDecimal.new('100'),
      'fifty_note' => BigDecimal.new('50'),
      'twenty_note' => BigDecimal.new('20')
    }

    @coins = {
      'ten_coin' => BigDecimal.new('10'),
      'five_coin' => BigDecimal.new('5'),
      'two_coin' => BigDecimal.new('2'),
      'one_coin' => BigDecimal.new('1'),
      'fifty_satang_coin' => BigDecimal.new('0.50'),
      'twenty_five_satang_coin' => BigDecimal.new('0.25')
    }
    end

    def report
        cross_check = {}
        first_input = change = BigDecimal.new(@input.to_s)
        puts "--"
        puts "A change of THB #{change}"
        @notes.each do |name, value|
        notes = (change / value).floor
        change = change % value
        type = notes > 1 ? "notes" : "note"
        puts "#{notes}\t of THB #{"%7.2f" % value.to_f}\t #{type}\t; THB\t #{"%7.2f" % change.to_f}\t remaining"
        cross_check[name] = notes
      end

      @coins.each do |name, value|
        coins = (change / value).floor
        change = change % value
        type = coins > 1 ? "coins" : "coin"
        puts "#{coins}\t of THB #{"%7.2f" % value.to_f}\t #{type}\t; THB\t #{"%7.2f" % change.to_f}\t remaining"
        cross_check[name] = coins
      end
      
      total = BigDecimal.new(0)
        cross_check.each do |type, count|
        total += @notes[type] * count unless @notes[type].nil?
        total += @coins[type] * count unless @coins[type].nil?
      end

      is_true = total == first_input ? "true" : "false"
      puts "Cross check #{"%7.2f" % total.to_f} #{is_true}."
      puts "--"
      end
    end

change = Change.new(2688.75)
change.report