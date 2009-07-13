#!/bin/env ruby

# 
# A simple example script using Ruby-SDL-FFI to load and display
# an image file. Loads and displays the image file given on the
# command line for 5 seconds, then quits.
# 
#   Usage:  load_image.rb /path/to/image"
# 
# Script last updated: June 21, 2009.
# 
# Ruby-SDL-FFI is still in flux, so expect the API style to
# change in the near future.
# 

require 'ruby-sdl-ffi'

path = ARGV[0]

if path.nil?
  puts "Usage: load_image.rb /path/to/image"
  exit 1
elsif not File.exist?( File.expand_path(path) )
  puts "Error: file doesn't exist: #{path}"
  exit 1
end

path = File.expand_path(path)

# Load the image file.
image = SDL::Image::Load( path )

# Create a new window the same size as the image.
screen = SDL::SetVideoMode(image.w, image.h, 0, 0)

# Blit the image onto the screen surface.
SDL::BlitSurface( image, nil, screen, nil )

# Update the screen.
SDL::UpdateRect( screen, 0, 0, 0, 0 )

# Set the screen title to the filename of the image.
SDL::WM_SetCaption( File.basename(path), File.basename(path) )

# Pause while the user admires the image.
sleep 5
