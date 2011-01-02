require 'spec_helper'

describe UsersController do

  describe 'for all users' do
    before :each do
      setups
    end
    describe 'post create' do
      before :each do
        @params={:user=>{}}
        User.should_receive(:new).and_return(@user)
      end
      describe 'where all is good' do
        before :each do
          @user.should_receive(:save).and_return(true)
          post 'create', @params
        end
        it 'should set a flash notice' do
          flash[:notice].should_not be_nil
        end
        it 'should render template for thankyou' do
          response.should render_template('users/thankyou')
        end
      end
      describe 'where there are errors' do
        before :each do
          @user.should_receive(:save).and_return(false)
          post 'create', @params
        end
        it 'should set a flash alert' do
          flash[:alert].should_not be_nil
        end
        it 'should set the user variable' do
          assigns[:user].should==@user
        end
        it 'should render new user template' do
          response.should render_template('users/new')
        end
      end
    end
    describe 'get index' do
      before :each do
        get 'index'
      end
      it 'should redirect to new' do
        response.should redirect_to(new_user_path)
      end
    end
    describe 'get new' do
      before :each do
        User.should_receive(:new).and_return(@user)
        get 'new'
      end
      it 'should set the user variable' do
        assigns[:user].should==@user
      end
      it 'should return a success code' do
        response.should be_success
      end
    end
  end


end
