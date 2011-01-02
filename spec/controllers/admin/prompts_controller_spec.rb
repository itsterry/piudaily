require 'spec_helper'

describe Admin::PromptsController do

  describe 'for all users (auth to be added)' do
    before do
      setups
    end

    describe 'post create' do
      before do
        @params={:prompt=>{}}
        Prompt.should_receive(:new).and_return(@prompt)
      end

      describe 'where parameters are good' do
        before do
          @prompt.should_receive(:save).and_return(true)
          post 'create', @params
        end
        it 'should set a flash notice' do
          flash[:notice].should_not be_nil
        end
        it 'should redirect to admin_prompts_path' do
          response.should redirect_to(admin_prompts_path)
        end
      end

      describe 'where parameters are incorrect' do
        before do
          @prompt.should_receive(:save).and_return(false)
          post 'create', @params
        end
        it 'should set a flash alert' do
          flash[:alert].should_not be_nil
        end
        it 'should render template admin/prompts/new' do
          response.should render_template('admin/prompts/new')
        end
      end
    end

    describe 'delet destroy' do
      before do
        @params={:id=>1}
      end
      describe 'where id is recognised' do
        before do
          Prompt.should_receive(:find_by_id).and_return(@prompt)
          @prompt.should_receive(:destroy)
          delete 'destroy', @params
        end
        it 'should set a flash notice' do
          flash[:notice].should_not be_nil
        end
        it 'should redirect to admin_prompts_path' do
          response.should redirect_to(admin_prompts_path)
        end
      end
      describe 'where id is NOT recognised' do
        before do
          Prompt.should_receive(:find_by_id).and_return(nil)
          delete 'destroy', @params
        end
        it 'should set flash alert' do
          flash[:alert].should_not be_nil
        end
        it 'should redirect to admin_prompts_path' do
          response.should redirect_to(admin_prompts_path)
        end
      end
    end



    describe 'get edit' do
      before do
        @params={:id=>1}
      end
      describe 'where id is recognised' do
        before do
          Prompt.should_receive(:find_by_id).and_return(@prompt)
          get 'edit', @params
        end
        it 'should set the prompt variable' do
          assigns[:prompt].should_not be_nil
        end
        it 'should render the template admin/prompts/edit' do
          response.should render_template('admin/prompts/edit')
        end
      end
      describe 'where id is NOT recognised' do
        before do
          Prompt.should_receive(:find_by_id).and_return(nil)
          get 'edit', @params
        end
        it 'should set flash alert' do
          flash[:alert].should_not be_nil
        end
        it 'should redirect to admin_prompts_path' do
          response.should redirect_to(admin_prompts_path)
        end
      end
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

    describe 'get new' do
      before do
        Prompt.should_receive(:new).and_return(@prompt)
        get 'new'
      end
      it 'should set the prompt variable' do
        assigns[:prompt].should_not be_nil
      end
      it 'should render template admin/prompts/new' do
        response.should render_template('admin/prompts/new')
      end
    end

    describe 'put update' do
      before do
        @params={:id=>1, :prompt=>{}}
      end
      describe 'where id is recognised' do
        before do
          Prompt.should_receive(:find_by_id).and_return(@prompt)
          @prompt.should_receive(:update_attributes)
        end
        describe 'where parameters are good' do
          before do
            @prompt.should_receive(:save).and_return(true)
            put 'update', @params
          end
          it 'should set a flash notice' do
            flash[:notice].should_not be_nil
          end
          it 'should redirect to admin_prompts_path' do
            response.should redirect_to(admin_prompts_path)
          end
        end
        describe 'where parameters are incorrect' do
          before do
            @prompt.should_receive(:save).and_return(false)
            put 'update', @params
          end
          it 'should set a flash alert' do
            flash[:alert].should_not be_nil
          end
          it 'should set the prompt variable' do
            assigns[:prompt].should_not be_nil
          end
          it 'should render the template admin/prompts/edit' do
            response.should render_template('admin/prompts/edit')
          end
        end
      end
      describe 'where id is NOT recognised' do
        before do
          Prompt.should_receive(:find_by_id).and_return(nil)
          put 'update', @params
        end
        it 'should set flash alert' do
          flash[:alert].should_not be_nil
        end
        it 'should redirect to admin_prompts_path' do
          response.should redirect_to(admin_prompts_path)
        end
      end
    end
  end
end
