#!/bin/env ruby

# 
# A simple example script using Ruby-SDL-FFI to load and display
# an svg file. Loads and displays the svg file given on the
# command line for 5 seconds, then quits.
# 
#   Usage:  load_svg.rb /path/to/image.svg"
# 
# Script last updated: Nov 29, 2009.
# 
# Ruby-SDL-FFI is still in flux, so expect the API style to
# change in the near future.
# 

require 'ruby-sdl-ffi'

path = ARGV[0]

if path.nil?
  puts "Usage: load_svg.rb /path/to/image.svg"
  exit 1
elsif not File.exist?( File.expand_path(path) )
  puts "Error: file doesn't exist: #{path}"
  exit 1
end

path = File.expand_path(path)

# Load the svg file.
svg = SDL::SVG.Load( path )

# Create a new window the same size as the image.
width = SDL::SVG.Width(svg).to_i
height = SDL::SVG.Height(svg).to_i
screen = SDL::SetVideoMode(width, height, 0, 0)

# Render the SVG onto the screen surface.
SDL::SVG.RenderToSurface(svg,0,0,screen)

# Update the screen.
SDL::UpdateRect( screen, 0, 0, 0, 0 )

# Set the screen title to the filename of the image.
SDL::WM_SetCaption( File.basename(path), File.basename(path) )

# Pause while the user admires the image.
sleep 5
