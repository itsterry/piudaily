require 'spec_helper'

describe '/users/new' do
  before :each do
    setups
    render
  end
  it 'should have an h1' do
    rendered.should have_selector('h1')
  end
  it 'should have a form' do
    rendered.should have_selector('form')
  end
  it 'should have a text field for firstname' do
    rendered.should have_selector(:input, :name=>'user[firstname]', :type=>'text')
  end
  it 'should have a text field for lastname' do
    rendered.should have_selector(:input, :name=>'user[lastname]', :type=>'text')
  end
  it 'should have a text field for email' do
    rendered.should have_selector(:input, :name=>'user[email]', :type=>'text')
  end
end