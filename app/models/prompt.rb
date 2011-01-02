class Prompt < ActiveRecord::Base

  has_many :assets

  validates :title, :presence=>true

  attr_accessor :attachment

  after_save :process_attachment

  public

  private

  def process_attachment
    if attachment
      a=self.assets.new(:attachment=>attachment)
      a.save
      self.attachment=nil
    end
    self.reload
  end


end
