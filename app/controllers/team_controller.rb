class TeamController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index; end
end
