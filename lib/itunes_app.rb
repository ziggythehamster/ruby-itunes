require "win32ole"

module ITunes
	
	# iTunes doesn't permit itself to run more than once,
	# but that doesn't stop us from allowing multiple instances
	# of ITunes::Application
	class Application

		# Called when you call ITunes::Application.new
		def initialize
			@app = WIN32OLE.new("iTunes.Application")
			raise "iTunes failed to initialize" unless @app # FIXME: Throw an exception object
		end

		######## PLAYER CONTROLS ##################################################
		
		# Reposition to the beginning of the current track or go to the previous
		# track if already at start of current track.
		def back_track
			return @app.BackTrack()
		end

		# Skip forward in a playing track.
		def fast_forward
			return @app.FastForward()
		end

		# Advance to the next track in the current playlist.
		def next_track
			return @app.NextTrack()
		end

		# Pause playback.
		def pause
			return @app.Pause()
		end

		# Play the currently targeted track.
		def play
			return @app.Play()
		end

		# Play the specified file path, adding it to the library if not already present.
		def play_file(file_name = "")
			return @app.PlayFile(file_name)
		end

		# Toggle the playing/paused state of the current track.
		def play_pause
			return @app.PlayPause()
		end

		# Return to the previous track in the current playlist.
		def previous_track
			return @app.PreviousTrack()
		end

		# Disable fast forward/rewind and resume playback, if playing.
		def resume
			return @app.Resume()
		end

		# Skip backwards in a playing track.
		def rewind
			return @app.Rewind()
		end

		# Stop playback.
		def stop
			return @app.Stop()
		end

		######## MISCELLANEOUS METHODS ############################################

		# Open the specified iTunes Store or streaming audio URL.
		def open_url(url)
			return @app.OpenURL(url)
		end

		# Exits the iTunes application.
		def quit
			@app.Quit
		end

		######## COLLECTIONS ######################################################

		# Returns an ITunes::SourceCollection
		def sources
			return ITunes::SourceCollection.new(@app)
		end
		
		######## PROPERTIES #######################################################
		

		# The full path to the current iTunes library XML file.
		def library_xml_path
			return @app.LibraryXMLPath()
		end

		# True if sound output is muted.
		def muted?
			return @app.Mute
		end

		# Sets if the sound output is muted.
		def muted=(muted)
			@app.Mute = muted
		end

		# Returns the version of the iTunes application
		def version
			return @app.Version()
		end

		# Returns the current sound output volume (range 0..100)
		def volume
			return @app.SoundVolume()
		end

		# Sets the sound output volume (range 0..100)
		def volume=(volume)
			@app.SoundVolume = volume
		end
	end
end
