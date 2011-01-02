require 'spec_helper'

describe '/prompts/index' do
  before :each do
    setups
  end
  describe 'where list of prompts is empty' do
    before do
      assigns[:prompts]=[]
      render
    end
    it 'should have an h1' do
      rendered.should have_selector('h1')
    end
  end

  describe 'where list of prompts is NOT empty' do
    before do
      assigns[:prompts]=[@prompt]
      render
    end
    it 'should have an h1' do
      rendered.should have_selector('h1')
    end

  end
end