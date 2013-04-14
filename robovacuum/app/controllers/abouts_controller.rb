class AboutsController < ApplicationController

  def show
    @about = About.order("created_at DESC").first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @about }
    end
  end

end
