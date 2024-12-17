class OpponentController < ApplicationController
  before_action :authenticate_user!, except: :index
  load_and_authorize_resource except: %i[index show]

  def index
    @opponent = Opponent.all.order('match_date ASC')
    # #Fixtures
    @schedule = Opponent.where('match_date >=?', Date.today).order('match_date ASC').group_by { |match| match.match_date.beginning_of_month }
    # #Results
    @result = Opponent.where('match_date <= ?',
                                Date.today).where.not(score_one: nil).where.not(score_two: nil).order('match_date DESC')


    @latest_season = Season.order(created_at: :desc).first
    params[:season_id] ||= @latest_season.id

    @table = if params[:season_id].present?
               Table.includes(opponent_team: { team_badge_attachment: :blob })
                 .where(season_id: params[:season_id])
                 .order(Arel.sql('w * 3 + d DESC'), Arel.sql('gf - ga DESC'))
             else
               Table.includes(opponent_team: { team_badge_attachment: :blob })
                 .order(Arel.sql('w * 3 + d DESC'), Arel.sql('gf - ga DESC'))
             end
  end

  def show
    @opponent = Opponent.find(params[:id])
  end

  def new
    @opponent = Opponent.new
  end

  def create
    @opponent = Opponent.new(opponent_params)
    @opponent.user_id = current_user.id

    respond_to do |format|
      if @opponent.save
        format.html { redirect_to opponent_index_path(@opponent), notice: 'Opponent was successfully created.' }
      else
        format.html { redirect_to opponent_index_url, notice: 'Failure' }
      end
    end
  end

  def destroy
    @opponent = Opponent.find(params[:id])
    @opponent.user_id = current_user.id
    @opponent.delete
    respond_to do |format|
      format.html { redirect_to opponent_index_path, notice: 'opponent was successfully deleted.' }
    end
  end

  def edit
    @opponent = Opponent.find(params[:id])
  end

  def update
    @opponent = Opponent.find(params[:id])
    respond_to do |format|
      if @opponent.update(opponent_params)
        format.html { redirect_to opponent_url(@opponent.id), notice: 'Opponent was successfully updated.' }
      else
        format.html { redirect_to opponent_index_url, notice: 'Failure' }
      end
    end
  end

  private

  def opponent_params
    params.require(:opponent).permit(:match_date, :match_time, :venue, :tournament, :score_one, :score_two, :user_id,
                                     :opponent_team_id, :season_id)
  end
end
