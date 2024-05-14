class ScorerController < ApplicationController
  before_action :authenticate_user!, except: :index
  load_and_authorize_resource

  def index
    @scorer = Scorer.all.order('created_at DESC')
  end

  def show
    @scorer = Scorer.find(params[:id])
  end

  def new
    @scorer = Scorer.new
    @scorer.opponent_id = params[:opponent_id]
  end

  def create
    @scorer = Scorer.new(scorer_params)
    @scorer.opponent_id = params[:opponent_id]
    @scorer.user_id = current_user.id

    respond_to do |format|
      if @scorer.save
        format.html { redirect_to opponent_path(@scorer.opponent), notice: 'Scorer was successfully created.' }
      else
        format.html { redirect_to scorer_index_url, notice: 'Failure' }
      end
    end
  end

  def destroy
    @scorer = Scorer.find(params[:id])
    @scorer.user_id = current_user.id
    @scorer.delete
    respond_to do |format|
      format.html { redirect_to scorer_index_path, notice: 'Scorer was successfully deleted.' }
    end
  end

  def edit
    @scorer = Scorer.find(params[:id])
  end

  def update
    @scorer = Scorer.find(params[:id])
    respond_to do |format|
      if @scorer.update(scorer_params)
        format.html { redirect_to scorer_url(@scorer.id), notice: 'Scorer was successfully updated.' }
      else
        format.html { redirect_to scorer_index_url, notice: 'Failure' }
      end
    end
  end

  private

  def scorer_params
    params.require(:scorer).permit(:name, :goals, :assists, :team_id, :user_id, :opponent_id)
  end
end
