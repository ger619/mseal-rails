class TeamController < ApplicationController
  skip_before_action :authenticate_user!, except: [:index]
  before_action :authenticate_user!, except: %i[index show]

  def index; end
end
