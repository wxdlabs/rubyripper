#!/usr/bin/env ruby
#    Rubyripper - A secure ripper for Linux/BSD/OSX
#    Copyright (C) 2007 - 2010  Bouke Woudstra (boukewoudstra@gmail.com)
#
#    This file is part of Rubyripper. Rubyripper is free software: you can
#    redistribute it and/or modify it under the terms of the GNU General
#    Public License as published by the Free Software Foundation, either
#    version 3 of the License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>

require 'rubyripper/fileAndDir'

# This class will cleanup previous Rubyripper files
class CleanPrefs
  def initialize(fileAndDir=nil)
    @file = fileAndDir ? fileAndDir : FileAndDir.new
  end

  # clean up the old config files
  def cleanup
    setOldConfigs()
    removeOldFiles()
  end

private

  # set the filenames to search for
  def setOldConfigs
    @oldFiles = Array.new
    @oldFiles << File.join(ENV['HOME'], '.rubyripper')
    @oldFiles << File.join(@oldFiles[0], 'settings')
    @oldFiles << File.join(@oldFiles[0], 'freedb.yaml')
    @oldFiles << File.join(ENV['HOME'], '.rubyripper_settings')
  end

  # remove old files
  def removeOldFiles
    while @oldFiles.length > 0
      @file.remove(@oldFiles.pop)
    end
  end
end
