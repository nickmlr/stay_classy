require 'nokogiri'

module StayClassyProcess

	# Once you've built an instance of stay_classy, it's time to hand it over to the channel 6 news team.
	def process( stay_classy )

		prefix = stay_classy.instance_variable_get( :@prefix )
		view_dirs = stay_classy.instance_variable_get( :@view_directories )

		printf "\nDirectories to make classy with prefix #{ prefix }: \n".colorize( :yellow )
		view_dirs.map { |vd| printf "#{ vd }\n" }

		# Send the right files to the nws team...
		printf "\nFiles to make classy: \n".colorize( :yellow )
		view_dirs.each do |vd|
			Dir.foreach( vd ) do |file|
				begin
					if file.match( StayClassy::Builder::VIEW_FILE_TYPES_REGEX )

						# Brian Fantana for Sex Pantherization
						brian_fantana( file )

						# Champ Kind for sex and chicken
						champ_kind( file )

						# What does he do with a toaster again?
						brick_tamland( file )

						# Maybe next time wear a bra
						veronica_corningstone( file )

					end
				rescue

				end
  		end
  	end

	end

	# Get the bits of real panther so you know it's good, even if they smell like a turd covered in burnt hair
	def load_file( file )
		@doc = Nokogiri::HTML::Document.parse( file )
	end
	alias :brian_fantana :load_file

	# Slap some BBQ sauce on them elements and... Hawoooooooo, woo, woo, woo!!!!
	def add_classes_to_file( file )
		printf "#{ file }\n"
	end
	alias :champ_kind :add_classes_to_file

	# Invite the ids to the pants party
	def add_ids_to_file( file )
		printf "#{ file }\n"
	end
	alias :brick_tamland :add_ids_to_file

	# Thanks for listening, San Diego. And stay classy, San Diego. Thanks for listening, San Diego.
	def save_new_file( file )
		printf "#{ file }\n"
	end
	alias :veronica_corningstone :save_new_file

	def baxter( file )
		printf "#{ file }\n"
	end
end