#!/usr/bin/env ruby

require "ruby-sdl-ffi"


# Get the path to the music file

path = ARGV[0]

if path.nil?
  puts "Usage: load_music.rb /path/to/song"
  exit 1
elsif not File.exist?( File.expand_path(path) )
  puts "Error: file doesn't exist: #{path}"
  exit 1
end

path = File.expand_path(path)


# Open audio device
if( SDL::Mixer::OpenAudio( 22050, SDL::AUDIO_S16SYS, 2, 1024 ) == -1 )
  puts "ERROR: Could not initialize audio: #{SDL::GetError()}"
  exit 1
end


# Make sure audio device closes at exit.
at_exit { SDL::Mixer::CloseAudio() }


# Load music
music = SDL::Mixer::LoadMUS( path )
if( music.to_ptr.null? )
  puts "ERROR: Could not load music: #{SDL::GetError()}"
  exit 1
end


# Play music
if( SDL::Mixer::PlayMusic( music.to_ptr, -1 ) == -1 )
  puts "ERROR: Could not play music: #{SDL::GetError()}"
  exit 1
end


# Let music play for a while...
sleep 10


# Fade out in 1 second
SDL::Mixer::FadeOutMusic( 1000 )


# Wait until it's done fading out.
while( SDL::Mixer::FadingMusic() == 1 )
  sleep 0.1
end
