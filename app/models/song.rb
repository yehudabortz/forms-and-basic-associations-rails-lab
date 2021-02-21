class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def song_notes=(contents)
    contents.each do |content|
      if content.strip != ""
        self.notes.build(content: content)
      end
    end
  end

  def song_notes
  #  self.notes.map(&:content)
   self.notes.map do |note|
    note.content
   end
  end
  
  def genre_id=(id)
    self.genre = Genre.find_by(id: id)
  end

  def genre_id
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end
end
