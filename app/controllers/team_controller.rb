class TeamController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  load_and_authorize_resource except: %i[index show]

  def index
    @teams = Team.includes([image_attachment: :blob]).all.order('jersey_number ASC')
  end

  def show
    @team = Team.find(params[:id])
    @statistic = Statistic.all.where(team_id: @team.id)
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = current_user.id

    respond_to do |format|
      if @team.save
        format.html { redirect_to team_url(@team), notice: 'Team was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity, notice: 'Failure' }
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
      if @team.update(team_params)
        format.html { redirect_to team_url(@team.id), notice: 'Team was successfully updated.' }
      else
        format.html { redirect_to team_index_url, notice: 'Failure' }
      end
    end
  end

  private

  def team_params
    params.require(:team).permit(:first_name, :second_name, :last_name, :position, :image, :jersey_number, :content,
                                 :user_id, :active, :date_of_birth, :mseal_debut, :first_goal, :previous_club, :twitter, :instagram)
  end
end
