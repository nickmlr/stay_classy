require 'spec_helper'

describe "The stay_classy gem" do
	describe "itself" do
	  it "should return the default stay_classy values if no options are given" do
	  	# this should check a folder with a bunch of views
	    stay_classy = StayClassy::Builder.new( options = {} )
	    expect( stay_classy.instance_variable_get( :@view_directories ) ).to eq( [] )
	  end

	  it "should validate the directories passed in as options" do
	    stay_classy = StayClassy::Builder.new( options = { :dirs => [ 'home' , 'about' , 'contact' , '../dookie' ] } )
	    expect( stay_classy.instance_variable_get( :@view_directories ) ).to eq( [] )
	  end

	  it "should use classy_ as a class prefix unless the user specifies one" do
	    stay_classy = StayClassy::Builder.new( options = {} )
	    expect( stay_classy.instance_variable_get( :@prefix ) ).to eq( 'classy_' )
	  end

	  it "should use the user supplied prefix if specified" do
	    stay_classy = StayClassy::Builder.new( options = { :prefix => 'testing_prefix' } )
	    expect( stay_classy.instance_variable_get( :@prefix ) ).to eq( 'testing_prefix_' )
	  end

	  it "should return an error message if there are no directories found" do
	  	classy = StayClassy::Builder.new( options = { :dirs => [ 'bad_directory_1', '../bad_directory_2', '/home/users' ] } )
	  	expect("No directories found. If you were a man I would punch you!")
	  end
	end
end