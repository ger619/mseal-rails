class TeamController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(news_params)
    @team.user_id = current_user.id

    respond_to do |format|
      if @team.save
        format.html { redirect_to team_url(@team), notice: 'Team was successfully created.' }
      else
        format.html { redirect_to team_url, notice: 'Failure' }
      end
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.delete
    respond_to do |format|
      format.html { redirect_to team_index_path, notice: 'News was successfully deleted.' }
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    respond_to do |format|
      if @team.update(news_params)
        format.html { redirect_to team_url(@team.id), notice: 'Team was successfully updated.' }
      else
        format.html { redirect_to team_index_url, notice: 'Failure' }
      end
    end
  end

  private

  def news_params
    params.require(:team).permit(:first_name, :second_name, :last_name, :position, :image, :jersey_number, :about,
                                 :user_id)
  end
end
