class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
  	new_song = Song.new
  	self.all << new_song
  	new_song
  end

  def self.new_by_name(name)
  	new_song = Song.new
  	new_song.name = name
  	new_song
  end

  def self.create_by_name(name)
  	new_song = Song.new
  	new_song.name = name
  	self.all << new_song
  	new_song
  end

  def self.new_from_filename(filename)
  	name = filename.split(" - ")[1].chomp(".mp3")
  	new_song = self.new_by_name(name)
  	new_song.artist_name = filename.split(" - ")[0]
  	new_song
  end

  def self.create_from_filename(filename)
  	name = filename.split(" - ")[1].chomp(".mp3")
  	new_song = self.create_by_name(name)
  	new_song.artist_name = filename.split(" - ")[0]
  	new_song
  end

  def self.find_by_name(name)
  	self.all.find do |song|
  		song.name == name
  	end
  end

  def self.find_or_create_by_name(name)
  	if self.find_by_name(name)
  		self.find_by_name(name)
  	else
  		self.create_by_name(name)
  	end
  end

  def self.all
    @@all
  end

  def self.alphabetical
  	self.all.sort_by do |song|
  		song.name
  	end
  end

  def self.destroy_all
  	self.all.clear
  end

  def save
    self.class.all << self
  end

end
