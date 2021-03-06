# require "classy/version"

#############################################################################
#  
# 															|
#   _____ ______   ____  __ __  |      __  _       ____  _____ _____ __ __ 
#  / ___/|      | /    ||  |  | |     /  ]| |     /    |/ ___// ___/|  |  |
# (   \_ |      ||  o  ||  |  |_|__  /  / | |    |  o  (   \_(   \_ |  |  |
#  \__  ||_|  |_||     ||  ~  |   | /  /  | |___ |     |\__  |\__  ||  ~  |
#  /  \ |  |  |  |  _  ||___, |   |/   \_ |     ||  _  |/  \ |/  \ ||___, |__
#  \    |  |  |  |  |  ||     |   |\     ||     ||  |  |\    |\    ||     |
#   \___|  |__|  |__|__||____/    | \____||_____||__|__| \___| \___||____/ 
# 					|					|						|_____ 															|
#       ____|         |           |     |      San Diego....._________|____
# 			|		|					|						|			|										|							|
#############################################################################

STAY_CLASSY_PATH = File.dirname(__FILE__) + "/stay_classy/"

require STAY_CLASSY_PATH + "stay_classy_process"
require 'colorize'
include StayClassyProcess


module StayClassy
	class Builder

		######## StayClassy will only look within the rails/app/views directory. Leave the rest to the channel 9 news team ########
		VIEWS_DIR = "app/views".freeze
		VIEW_FILE_TYPES_REGEX = Regexp.union( /\.html\.erb$/ , /\.html$/ ).freeze
		DEFAULT_CLASS_TAGS = %w( h1 h2 h3 h4 h5 h6 div table p li tr td ).freeze
		DEFAULT_ID_TAGS = %w( p span ul ).freeze

	  def initialize( options )
	  	begin
		  	# Handle user-specified directories here
		  	if !options[:dirs].empty?

		  		directories = options[:dirs]
		  		@view_directories = []
		  		
		  		directories.each do |dir|

		  			# Filter out the not so classy characters. No scotch or ribs for them. Banish them to a whale's vagina
		  			dir = dir.gsub( /[^0-9a-z_-]/i, '' )

		  			# Build an array of valid directories, kind of like a shelf of leather-bound books.
		  			if valid_dir?( dir ) 
		  				@view_directories << "#{ VIEWS_DIR }/#{ dir }"
		  			else
		  				printf "\n#{ VIEWS_DIR }/#{ dir } is not a valid directory. That's bush!\n".colorize( :red )
		  			end
		  		end

		  	else
		  		@view_directories = get_view_directories
		  	end

		  	######## Prefix for all classes/ids ########
		  	options[:prefix] ? @prefix = set_prefix( options[:prefix].to_s ) : @prefix = 'classy_'

		  	if options[:tags]
		  		# TODO: Check if valid HTML tag
		  		######## Handle tags passed in ########
		  	end

		  rescue Exception => e
		  	raise e
		  end
	  end

		# Sixty percent of the time, valid directories will return true every time
		def valid_dir?( directory )
			Dir.exists?( "#{ VIEWS_DIR }/#{ directory }" )
		end

		# If no directories are specified, find every directory in the views folder recursively
		def get_view_directories
			Dir.glob( "#{ VIEWS_DIR }**/*/" ).select { |f| File.directory? f }
		end

		def set_prefix( prefix )
			starter_string = prefix.gsub( /[^0-9a-z_-]/i, '' )
			return "#{ starter_string }_"
		end

	end
end