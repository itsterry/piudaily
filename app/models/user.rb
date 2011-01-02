class User < ActiveRecord::Base

  validates :firstname, :presence=>true
  validates :lastname, :presence=>true
  validates :email, :presence=>true,
                    :uniqueness=>true,
                    :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

end
