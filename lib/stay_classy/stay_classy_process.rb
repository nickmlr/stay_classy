require 'nokogiri'

module StayClassyProcess

	# Once you've built an instance of stay_classy, douse it with Sex Panther.
	def process( stay_classy )

		# if you need the views directory: StayClassy::Builder::VIEWS_DIR
		prefix = stay_classy.instance_variable_get(:@prefix)
		stay_classy.instance_variable_get(:@views_dir)
		view_dirs = stay_classy.instance_variable_get(:@specified_view_directories)

		printf "\n\n Directories to make classy with prefix #{ prefix }: \n".colorize( :yellow )

		# Have Brian Fantana load those files.
		view_dirs.each do |vd|
			Dir.foreach( vd ) do |file|
				if file.match( StayClassy::Builder::VIEW_FILE_TYPES_REGEX )
					brian_fantana( file )
				end
  		end
  	end

		# I want to be on those files.
	end

	# Prepare the Sex Panther
	def load_file( input )
		@doc = doc = Nokogiri::HTML::Document.parse( input )
		p input
	end
	alias :brian_fantana :load_file

	# Slap some BBQ sauce on them elements and... Hawoooooooo, woo, woo, woo!!!!
	def add_classes_to_file
	end
	alias :champ_kind :add_classes_to_file

	# Invite the ids to the pants party
	def add_ids_to_file
	end
	alias :brick_tamlin :add_ids_to_file

	# Thanks for listening, San Diego
	def save_new_file
	end
	alias :veronica_corningstone :save_new_file
end