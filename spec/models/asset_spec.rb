require 'spec_helper'

describe Asset do
  before do
    @valid_attributes = {
      :prompt_id => 1,
      :attachment=>'test'
    }
    @klass=Asset
    @o=@klass.new(@valid_attributes)
  end

  it "should create a new instance given valid attributes" do
    @o.save.should be_true
  end

end
