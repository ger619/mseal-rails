class OpponentController < ApplicationController
  def index
    @opponents = Opponent.all
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
        format.html { redirect_to opponent_index_path, notice: 'Failure' }
      end
    end
  end

  def edit
    @opponent = Opponent.find(params[:id])
  end

  def update
    @opponent = Opponent.find(params[:id])

    respond_to do |format|
      if @opponent.update(opponent_params)
        format.html { redirect_to opponent_index_path(@opponent), notice: 'Opponent was successfully updated.' }
      else
        format.html { redirect_to opponent_index_path, notice: 'Failure' }
      end
    end
  end

  def destroy
    @opponent = Opponent.find(params[:id])
    @opponent.delete

    respond_to do |format|
      format.html { redirect_to opponent_index_path, notice: 'Opponent was successfully deleted.' }
    end
  end

  private

  def opponent_params
    params.require(:opponent).permit(:opponent_name, :description, :photo_opponent, :user_id)
  end
end
