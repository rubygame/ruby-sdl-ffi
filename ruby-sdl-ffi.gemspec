#--
#
# This file is one part of:
#
# Ruby-SDL-FFI - Ruby-FFI bindings to SDL
#
# Copyright (c) 2009, 2010  John Croisant
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
#++


# Force create ChangeLog.txt if running from gem (build).
# This is done in Rakefile when running from rake.
if /gem/i =~ $0
  `ruby scripts/mkchangelog.rb ChangeLog.txt`
end


$gemspec = Gem::Specification.new do |s|

  s.name     = "ruby-sdl-ffi"
  s.version  = "0.3"
  s.authors  = ["John Croisant"]
  s.email    = "jacius@gmail.com"
  s.homepage = "http://github.com/rubygame/ruby-sdl-ffi/"
  s.summary  = "Ruby-FFI bindings to SDL"
  s.description = <<EOF
Ruby-SDL-FFI is a low-level binding to SDL and related libraries
using Ruby-FFI. It provides very basic access to SDL from
Ruby without the need for a compiled C wrapper. It aims to
be platform and Ruby implementation independent.
EOF

  s.rubyforge_project = "ruby-sdl-ffi"
  s.has_rdoc = false
  s.files = Dir["*.rdoc", "lib/**/*.rb"] + ["ChangeLog.txt"]
  s.require_paths = ["lib"]

  s.required_ruby_version = ">= 1.8"

  s.add_dependency( "nice-ffi", ">=0.2"   )

  s.requirements = ["SDL       >= 1.2.13",
                    "SDL_image >= 1.2.7  (optional)",
                    "SDL_gfx   >= 2.0.13 (optional)",
                    "SDL_mixer >= 1.2.8  (optional)",
                    "SDL_ttf   >= 2.0.9  (optional)"]

end
