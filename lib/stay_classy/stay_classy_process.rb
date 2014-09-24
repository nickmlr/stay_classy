require 'tempfile'
require 'fileutils'

module StayClassyProcess

	# Once you've built an instance of stay_classy, it's time to hand it over to the channel 6 news team.
	def process( stay_classy )

		prefix = stay_classy.instance_variable_get( :@prefix )
		view_dirs = stay_classy.instance_variable_get( :@view_directories )

		printf "\nDirectories to make classy with prefix #{ prefix }: \n".colorize( :yellow )
		view_dirs.map { |vd| printf "#{ vd }\n" }

		# Send the right files to the news team...
		printf "\nFiles to make classy: \n".colorize( :yellow )
		view_dirs.each do |vd|
			Dir.foreach( vd ) do |file|

				# Send each file in each file in the directory to each member of the news team
				begin
					@errors ||= []

					if file.match( StayClassy::Builder::VIEW_FILE_TYPES_REGEX )

						@view_directory ||= vd

						# Brian Fantana for Sex Pantherization.
						# He gets @filename for the rest of the team.
						brian_fantana( file )

						# Champ Kind takes @filename for sex and chicken
						champ_kind( @filename )

						# Puts @filename in a toaster...fantastic
						brick_tamland( @filename )

						# Wears a bra next time
						veronica_corningstone( @filename )
					end

				rescue Exception => e

					# Bark out those errors, Baxter. You know I don't speak Spanish.
      		baxter( e )
      		printf "#{ @errors }\n" if @errors.any?

				end
  		end
  	end

	end

############### LADIES AND GENTLEMEN, NEWS TEAM 6 ###############

	# Get the bits of real panther so you know it's good (it opens the file)
	def load_file( file )
		begin
			@filename ||= file
		rescue Exception => e
			baxter( e )
		end
	end
	alias :brian_fantana :load_file

	# Slap some BBQ sauce on them elements and woo, woo, woo!!!!
	def add_classes_to_file( filename )

		path = "#{@view_directory}#{filename}"
		temp_file = Tempfile.new( 'foo' )

		begin
		  File.open( path, 'r' ) do |file|
		    file.each_line do |line|
		      temp_file.puts make_classy( line )
		    end
		  end
		  temp_file.close
		  FileUtils.mv( temp_file.path, path )
		rescue Exception => e
			baxter( e )
		ensure
		  temp_file.close
		  temp_file.unlink
		end

	end
	alias :champ_kind :add_classes_to_file

	# Invite the ids to the pants party
	def add_ids_to_file( filename )
		# TODO: pass in predefined ids
		path = "#{@view_directory}#{filename}"
		temp_file = Tempfile.new( 'foo' )

		begin
		  File.open( path, 'r' ) do |file|
		    file.each_line do |line|
		      temp_file.puts show_me_your_id( line )
		    end
		  end
		  temp_file.close
		  FileUtils.mv( temp_file.path, path )
		rescue Exception => e
			baxter( e )
		ensure
		  temp_file.close
		  temp_file.unlink
		end
	end
	alias :brick_tamland :add_ids_to_file

	# Thanks for listening, San Diego. And stay classy, San Diego. Thanks for listening, San Diego.
	def save_new_file( filename )
		begin
		rescue Exception => e
			baxter( e )
		end
	end
	alias :veronica_corningstone :save_new_file

########################### Errors ##############################
	
	# Really doesn't need to be here. He just barks out errors
	def baxter( exception )
		@errors << exception
	end

######################### Modify the strings ####################

	def	make_classy( line )
		return "classy" + line
	end

	def show_me_your_id( line )
		return "id" + line
	end
end