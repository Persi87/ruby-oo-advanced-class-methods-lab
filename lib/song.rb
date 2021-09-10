class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new     # self is the class - This creates a new instance and saves it to song variable
    song.save           # .save will then shovel "self" (the instance) into @@all array
    song                # we then return the new song
  end                 

  def self.new_by_name(name)
    song = self.new         # save new instance to song variable
    song.name = name        # does same as self.create method, but we use .name to set the name on the instance
    song                    # (.name is a setter method from the attr_accessor) returns the new instance                  
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    # if self.find_by_name(name)
    #    self.find_by_name(name)
    # else
    #    self.create_by_name(name)
    # end
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    file = filename.chomp(".mp3").split(" - ")
    song.artist_name = file[0]
    song.name = file[1]
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    file = filename.chomp(".mp3").split(" - ")
    song.artist_name = file[0]
    song.name = file[1]
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
