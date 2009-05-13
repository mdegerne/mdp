class BdcsController < ApplicationController
  before_filter :login_required
  before_filter :title

  def index
    @results = current_user.results
  end

  def new
    @result = Result.new
  end

  def create
    @result = Result.new({:user_id => current_user})
    @result.resulthash = params[:bdc]
    if @result.save
      index
      render :action => :index
    else
      flash.now[:error]=@result.errors.full_messages.join("\n")
      render :action => :new
    end
  end

private
  def title
    @title = "Burns Depression Checklist"
  end
end
