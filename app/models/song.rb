class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_text=(text)
    text.each do |text|
      if !text.empty?
        note = Note.create(content: text)
        self.notes << note
      end
    end
  end

  
end
