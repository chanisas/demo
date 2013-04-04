class Furby

	def initialize
		@money_consumed = 0
		@age = 0
		@emotion = 0
	end

	def cuddle(price = 1)
		@money_consumed += price
		@age += 1
		@emotion += 0.1 * price
	end

	def  bonk(price = 1)
		@money_consumed += price
		@age += 1
		@emotion -= 0.3 * price
	end

	def do_something
		if @emotion > 0
			puts "laugh"
		else
			puts "rawr!"
		end
	end

	def tco
		puts @money_consumed
	end


		furby = Furby.new
		furby.cuddle
		furby.cuddle
		furby.cuddle
		furby.cuddle
		furby.bonk
		furby.bonk
		furby.do_something
		furby.tco
	end