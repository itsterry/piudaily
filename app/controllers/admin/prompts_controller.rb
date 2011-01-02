class Admin::PromptsController < ApplicationController

  def create
    @prompt=Prompt.new(params[:prompt])
    if @prompt.save
      redirect_to admin_prompts_path, :notice=>'Prompt Created'
    else
      flash[:alert]='Check for errors'
      return render(:action=>'new')
    end
  end

  def destroy
    get_prompt
    if @prompt
      @prompt.destroy
      flash[:notice]='Prompt destroyed'
    end
    return redirect_to(admin_prompts_path)
  end

  def edit
    get_prompt
    unless @prompt
      return redirect_to(admin_prompts_path)
    end
  end

  def index
    get_prompts
  end

  def new
    @prompt=Prompt.new
  end

  def update
    get_prompt
    unless @prompt
      return redirect_to(admin_prompts_path)
    end
    @prompt.update_attributes(params[:prompt])
    if @prompt.save
      redirect_to admin_prompts_path, :notice=>'Prompt Saved'
    else
      flash[:alert]='Check for errors'
      return render(:action=>'edit')
    end
  end

  private

  def get_prompt
    @prompt=Prompt.find_by_id(params[:id])
    unless @prompt
      flash[:alert]='Could not find that one'
    end
  end

  def get_prompts
    @prompts=Prompt.all
  end
end
