class ToysController < ApplicationController

	def index
		@title = "Toys"
		@toys = Toy.all
	end

	def new
		@title = "New Toy"
		@toy = Toy.new
	end

	def create
		toy_params = params.require(:toy).permit(:name, :manufacturer, :serial_number, :image_url)
		toy = Toy.new(toy_params)
		toy.save
		puts "Toy Created"
		redirect_to '/toys'
	end

	def show
		
		@toy = Toy.find(params[:id])

		@title = "#{@toy.name}"

		# random number list to populate 5 'related' toys under product
		# array is populated with 5 unique random numbers used to find id from DB
		@random_number_array = [] 
		i = 0 # counter to determine when 5 numbers have been added to array
		largest_id = Toy.last.id
		while i < 5 do  
			random_number = rand(1..largest_id)
			if(!@random_number_array.include? random_number) # ensures that the number isnt in the array
				@random_number_array[i] = random_number
				i += 1;
			end
		end
	end



end
