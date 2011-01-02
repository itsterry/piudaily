class Asset < ActiveRecord::Base

  mount_uploader :attachment, AttachmentUploader

  belongs_to :prompt

  validates :prompt_id, :presence=>true



end
