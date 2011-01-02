require 'spec_helper'

describe PromptsController do

  describe 'for all users' do
    before do
      setups
    end

    describe 'get index' do
      before do
        get 'index'
      end
      it 'should set the prompts variable' do
        assigns[:prompts].should_not be_nil
      end
      it 'should render template prompts/index' do
        response.should render_template('prompts/index')
      end
    end
  end

end
