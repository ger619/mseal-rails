class OpponentController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: :index
  def index
    @opponent = Opponent.order('match_date ASC')
    # @opponent = Opponent.where('match_date <= ?', Date.today).where.not(score_one: nil).where.not(score_two: nil).last
  end

  def show
    @opponent = Opponent.find(params[:id])
  end

  def new
    @opponent = Opponent.new
  end

  def create
    @opponent = Opponent.new(opponent_params)
    @opponent.user = current_user

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
    @opponent.user = current_user
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
                                     :opponent_team_id)
  end
end
