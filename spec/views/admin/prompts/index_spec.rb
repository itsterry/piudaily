require 'spec_helper'

describe '/admin/prompts/index' do
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
    it 'should have a link to make a new prompt' do
      rendered.should have_selector('a',:content=>'New Prompt')
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