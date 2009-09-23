module ITunes
	# SourceCollection is a collection of Sources. Works like Array, but also implements some
	# extra iTunes functionality.
	class SourceCollection
		# Pass in the WIN32OLE object that is the app.
		def initialize(app)
			@app = app
			@sources = []

			populate_sources_array
		end

		# Returns a specific source from the collection.
		def [](index)
			populate_sources_array
			return @sources[index]
		end

		# Returns the number of sources
		def size
			populate_sources_array
			return @sources.size
		end

		# Yields each source in the collection.
		def each
			populate_sources_array

			@sources.each do |source|
				yield source
			end
		end

		# Returns the source specified by the persistent ID
		def by_persistent_id(id_high, id_low)
			return @app.Sources.ItemByPersistentID(id_high, id_low)
		end

		private
			def populate_sources_array
				@sources_array = []

				# Populate an array with the sources.
				@app.Sources.Count.times do |index|
					# FIXME: This should return an instance of ITunes::Source
					@sources << sources.Item(index)
				end
			end
	end
end
