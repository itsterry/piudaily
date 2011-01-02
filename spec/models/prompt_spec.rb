require 'spec_helper'

describe Prompt do
  before do
    @valid_attributes = {
      :title => "test"
    }
    @klass=Prompt
    @o=@klass.new(@valid_attributes)
  end

  it "should create a new instance given valid attributes" do
    @o.save.should be_true
  end

  mandatory_string(:title)

  #optional_thing(:asset)
end
