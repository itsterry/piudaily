class PromptsController < ApplicationController

  def index
    get_prompts
  end

  private

  def get_prompts
    @prompts=Prompt.where('displayit =?',true)
  end

end
