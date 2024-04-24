class StatisticController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @statistics = Statistic.all
  end

  def show
    @statistic = Statistic.find(params[:id])
  end

  def new
    @statistic = Statistic.new
  end

  def create
    @statistic = Statistic.new(statistic_params)
    @statistic.user = current_user

    respond_to do |format|
      if @statistic.save
        format.html { redirect_to statistic_index_path, notice: 'Statistic was successfully created.' }
      else
        format.html { redirect_to statistic_index_url, notice: 'Failure' }
      end
    end
  end

  def destroy
    @statistic = Statistic.find(params[:id])
    @statistic.delete
    respond_to do |format|
      format.html { redirect_to statistic_index_path, notice: 'Statistic was successfully deleted.' }
    end
  end

  def edit
    @statistic = Statistic.find(params[:id])
  end

  def update
    @statistic = Statistic.find(params[:id])
    respond_to do |format|
      if @statistic.update(statistic_params)
        format.html { redirect_to statistic_index_path, notice: 'Statistic was successfully updated.' }
      else
        format.html { redirect_to statistic_index_url, notice: 'Failure' }
      end
    end
  end

  private

  def statistic_params
    params.require(:statistic).permit(:kpl_appearance, :kpl_goal, :kpl_yellow, :kpl_redcard, :fkfcup_appearance,
                                      :fkfcup_goal, :fkfcup_redcard, :fkfcup_yellow, :team_id, :user_id)
  end
end
