# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'webrat'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec
  config.include Webrat::Matchers, :type => :views
  
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true
end

MODELNAMES=%w{
                asset
                prompt
                user
              }

def mock_request
  request=mock('request') unless request
  request.stub!(:env_table).and_return({'HTTP_HOST'=>'http://localhost'})
  request.stub!(:remote_host).and_return({'HTTP_HOST'=>'http://localhost'})
end

def setups
  ActionView::Base.stub!(:spec_mocks_mock_path).and_return('/')
  @i=1
  @s='test'
  @b=nil
  @f=0.0
  @a=[]
  @t=Time.now

  mock_request
  @mock_errors=mock('errors')
  @mock_errors.stub!(:count).and_return(0)
  @mock_errors.stub!(:[]).and_return('')

  MODELNAMES.each do |name|
    instance_variable_set '@'+name, mock(name, :to_param=>'1')
  end

  MODELNAMES.collect{|n| [eval('@'+n),eval(n.camelize)]}.each do |o,c|

    c.stub!(:all).and_return([o])
    c.stub!(:where).and_return([o])



    c.stub!(:find).and_return(o)
    c.stub!(:find).with(1).and_return(o)
    c.stub!(:find_by_id).and_return(o)
    c.stub!(:save).and_return(o)
    o.stub!(:class).and_return(c)
    o.stub!(:empty?).and_return(false)
    o.stub!(:errors).and_return(@mock_errors)
    o.stub!(:new_record?).and_return(false)
    o.stub!(:sort_by).and_return(o)
    o.stub!(:destroy).and_return(o)
    o.stub!(:reload).and_return(o)
    o.stub!(:size).and_return(@i)
    o.stub!(:save).and_return(o)
    o.stub!(:update_attributes).and_return(o)
    o.stub!(:created_at).and_return(@t)
    o.stub!(:updated_at).and_return(@t)
    o.stub!(:id).and_return(@i)
    o.stub!(:paginate).and_return([o])
    o.stub!(:map).and_return([o])
    o.stub!((o.class.to_s.downcase+'_id').to_sym).and_return(@i)
    o.stub!(:displayit).and_return(@s)
    o.stub!(:position).and_return(@s)
    o.stub!(:title).and_return(@s)
    o.stub!(:to_key).and_return([])

    #acts_as_tree functions
    o.stub!(:ancestors).and_return([])
    o.stub!(:children).and_return([])
    o.stub!(:descendants).and_return([])
    o.stub!(:self_and_descendants).and_return([])
    o.stub!(:parent_id).and_return(@i)
    o.stub!(:parent).and_return(nil)



    MODELNAMES.each do |name|
      o.stub!((name+'_id').to_sym).and_return(@i)
      o.stub!((name).to_sym).and_return(eval('@'+name))
      o.stub!((name.pluralize).to_sym).and_return([eval('@'+name)])
    end
  end


  MODELNAMES.each do |c|
      self.send('setup_'+c)
  end

end



def setup_asset
  unless @asset
    setups
  end
  o=@asset
  c=Asset

  #generic functions

  #From the database
  o.stub!(:attachment).and_return(@s)

  #ActiveRecord Associations

  #Class Methods

  #Instance Methods

end

def setup_prompt
  unless @prompt
    setups
  end
  o=@prompt
  c=Prompt

  #generic functions

  #From the database
  o.stub!(:title).and_return(@s)
  o.stub!(:displayit).and_return(@i)

  #ActiveRecord Associations

  #Class Methods

  #Instance Methods

end

def setup_user
  unless @user
    setups
  end
  o=@user
  c=User

  #generic functions
  o.stub!(:current_login).and_return(@t)
  o.stub!(:email).and_return(@s)
  o.stub!(:firstname).and_return(@s)
  o.stub!(:last_login).and_return(@t)
  o.stub!(:lastname).and_return(@s)
  o.stub!(:new_password).and_return(@s)
  o.stub!(:confirm_new_password).and_return(@s)
  o.stub!(:password_hash).and_return(@s)
  o.stub!(:password_salt).and_return(@s)
  o.stub!(:full_name).and_return(@s)
  o.stub!(:fullname).and_return(@s)
  o.stub!(:is_admin?).and_return(false)
  o.stub!(:is_authorized?).and_return(false)
  o.stub!(:is_terry?).and_return(false)
  o.stub!(:login!).and_return(@t)
  o.stub!(:refresh_password).and_return(@s)


  #From the database
  o.stub!(:agreetc).and_return(@i)
  o.stub!(:duedate).and_return(@d)
  o.stub!(:mobile).and_return(@s)

  #ActiveRecord Associations

  #Class Methods

  #Instance Methods
  o.stub!(:current_mood).and_return(@mood)
  o.stub!(:current_mymood).and_return(@mymood)
  o.stub!(:title).and_return(@s)
  o.stub!(:unresolved).and_return([@mymoodfood])
  o.stub!(:unresolved?).and_return(true)

end

def mandatory_string(thing)

  describe 'mandatory string '+thing.to_s do
    before :each do
      @f=thing
      @fp=@f.to_s+'='
    end
    it 'should respond' do
      @o.respond_to?(@f).should be_true
    end
    it 'should reject a blank value' do
      @o.send(@fp,'')
      @o.should_not be_valid
    end
    it 'should reject a nil value' do
      @o.send(@fp,nil)
      @o.should_not be_valid
    end
  end
end