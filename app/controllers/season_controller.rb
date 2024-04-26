class SeasonController < ApplicationController
  load_and_authorize_resource except: %i[index show]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @seasons = Season.all
  end

  def show
    @season = Season.find(params[:id])
  end

  def new
    @season = Season.new
  end

  def create
    @season = Season.new(season_params)
    @season.user_id = current_user.id
    respond_to do |format|
      if @season.save
        format.html { redirect_to season_url(@season), notice: 'Season was successfully created.' }
        format.json { render :show, status: :created, location: @season }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @season.errors, status: :unprocessable_entity }
      end
    end
  end


  def edit
    @season = Season.find(params[:id])
  end


  def update
    @season = Season.find(params[:id])
    respond_to do |format|
      if @season.update(season_params)
        format.html { redirect_to season_url(@season), notice: 'Season was successfully updated.' }
        format.json { render :show, status: :ok, location: @season }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @season.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @season = Season.find(params[:id])
    @season.destroy
    respond_to do |format|
      format.html { redirect_to seasons_url, notice: 'Season was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def season_params
    params.require(:season).permit(:name, :start_date, :end_date, :user_id, :statistics_id, :team_id)

  end
end
