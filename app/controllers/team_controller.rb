class TeamController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index], raise: false
  before_action :authenticate_user!, except: %i[index show]

  def index; end
end
