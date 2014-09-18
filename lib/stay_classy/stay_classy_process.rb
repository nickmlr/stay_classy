require 'nokogiri'

module StayClassyProcess

	# Once you've built an instance of stay_classy, douse it with Sex Panther.
	def process( stay_classy )

		# if you need the views directory: StayClassy::Builder::VIEWS_DIR
		prefix = stay_classy.instance_variable_get(:@prefix)
		stay_classy.instance_variable_get(:@views_dir)
		view_dirs = stay_classy.instance_variable_get(:@specified_view_directories)

		printf "\n\n Directories to make classy with prefix #{ prefix }: \n".colorize( :yellow )

		view_dirs.each do |view_dir|
			printf "#{ view_dir }\n".colorize( :green )
		end

		# I want to be on those files.
		doc = Nokogiri::HTML( '' )
  		# doc.css("div.to-replace").each do |div|
    # 		 "get_html_text" will obtain HTML from db. It can be anything, even another tags, tag groups etc.
    # 		div.replace self.get_html_text
  		# end
  		# self.content = doc.css("body").first.inner_html
	end

	def load_file
	end

	def add_classes_to_file
	end

	def add_ids_to_file
	end

	def save_new_file
	end
end