class PartialsController < ApplicationController
  def show
    render partial: "team/#{params[:partial]}"
  end
end
