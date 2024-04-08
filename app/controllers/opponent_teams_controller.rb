class OpponentTeamsController < ApplicationController
  before_action :set_opponent_team, only: %i[show edit update destroy]

  # GET /opponent_teams or /opponent_teams.json
  def index
    @opponent_teams = OpponentTeam.all
  end

  # GET /opponent_teams/1 or /opponent_teams/1.json
  def show; end

  # GET /opponent_teams/new
  def new
    @opponent_team = OpponentTeam.new
  end

  # GET /opponent_teams/1/edit
  def edit; end

  # POST /opponent_teams or /opponent_teams.json
  def create
    @opponent_team = OpponentTeam.new(opponent_team_params)

    respond_to do |format|
      if @opponent_team.save
        format.html { redirect_to opponent_team_url(@opponent_team), notice: 'Opponent team was successfully created.' }
        format.json { render :show, status: :created, location: @opponent_team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @opponent_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opponent_teams/1 or /opponent_teams/1.json
  def update
    respond_to do |format|
      if @opponent_team.update(opponent_team_params)
        format.html { redirect_to opponent_team_url(@opponent_team), notice: 'Opponent team was successfully updated.' }
        format.json { render :show, status: :ok, location: @opponent_team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @opponent_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opponent_teams/1 or /opponent_teams/1.json
  def destroy
    @opponent_team.destroy

    respond_to do |format|
      format.html { redirect_to opponent_teams_url, notice: 'Opponent team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_opponent_team
    @opponent_team = OpponentTeam.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def opponent_team_params
    params.require(:opponent_team).permit(:name, :team_url, :team_badge)
  end
end
