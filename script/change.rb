require 'bigdecimal'

 class Change
 def initialize
   @input = 3788.75
   @money = [1000, 500, 100, 50, 20, 10, 5, 1, 0.5, 0.25]
 end

 def report
   puts "A change of THB #{@input}"
   @t = {}

   @money.each do |m|
     next if @input < m

       if @input >= 1
         @t["#{m}"] = @input.floor / m
         @input = @input - (m * @t["#{m}"])
         @tt = @t["#{m}"]
       else
         @t["#{m}"] = @input / m
         @input = @input - m
         @tt = @t["#{m}"].floor
       end

       if m > 10
         puts "#{@tt} of THB #{m}    notes; THB   #{@input} remaining"
       else
         puts "#{@tt} of THB #{m}    coin; THB   #{@input} remaining"
       end
   end
 end
  cha = Change.new()
 cha.report
end