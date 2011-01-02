require 'spec_helper'

describe User do
  before do
    @valid_attributes = {
      :firstname => "value for firstname",
      :lastname => "value for lastname",
      :email => "a@a.com"
    }
    @klass=User
    @o=@klass.new(@valid_attributes)
  end

  it "should create a new instance given valid attributes" do
    @o.save.should be_true
  end

  mandatory_string(:firstname)
  mandatory_string(:lastname)
  mandatory_string(:email)


end
