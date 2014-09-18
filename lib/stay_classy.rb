# require "classy/version"

STAY_CLASSY_PATH = File.dirname(__FILE__) + "/stay_classy/"

require STAY_CLASSY_PATH + "stay_classy_process"
require 'colorize'
include StayClassyProcess

module StayClassy
	class Builder

		######## StayClassy will only look within the rails/app/views directory ########
		VIEWS_DIR = '/home/users/nmueller/Sandbox/tester/app/views/'.freeze #"#{ Rails.root.join( 'app', 'views' ) }"
		DEFAULT_CLASS_TAGS = %w( h1 h2 h3 h4 h5 h6 div table p ).freeze
		DEFAULT_ID_TAGS = %w( p span ).freeze

	  def initialize( options )

	  	# Handle user-specified directories here
	  	if options[:dirs]

	  		directories = options[:dirs]
	  		@specified_view_directories = []
	  		
	  		directories.each do |dir|

	  			# Filter out the not so classy characters. No scotch or ribs for them. Banish them to a whale's vagina
	  			dir.gsub( /[^0-9a-z -_]/i, '' )

	  			# Build an array of valid directories
	  			if valid_dir?( dir ) 
	  				@specified_view_directories << "#{ VIEWS_DIR }#{ dir }"
	  			else 
	  				printf "\n#{ VIEWS_DIR }#{ dir } is not a valid directory".colorize( :red )
	  			end
	  		end

	  	else
	  		@specified_view_directories = get_view_directories
	  	end

	  	######## Prefix for all classes/ids ########
	  	options[:prefix] ? @prefix = set_prefix( options[:prefix].to_s ) : @prefix = 'classy_'

	  	if options[:tags]
	  		######## Handle tags passed in ########
	  	end
	  end

	  def valid_dir?( directory )
		  Dir.exists?( "#{ VIEWS_DIR }#{ directory }" )
		end

		# If no directories are specified, find every directory in the views folder recursively
		def get_view_directories
			Dir.glob( "#{ VIEWS_DIR }**/*/" ).select { |f| File.directory? f }
		end

		def set_prefix( prefix )
			starter_string = prefix.gsub( /[^0-9a-z ]/i, '' )
			return "#{ starter_string }_"
		end

	end
end

# Pass intended directories and class/id prefix to new
stay_classy = StayClassy::Builder.new( options = { :prefix => 'nmm',
																					:dirs => %w( home ../shared users/sub_users )
																				 } )

# Send it off for processing if it all checks out
StayClassyProcess.process( stay_classy ) unless stay_classy.instance_variable_get( :@specified_view_directories ).count == 0