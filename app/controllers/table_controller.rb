class TableController < ApplicationController
  before_action :authenticate_user!

  def index
    # Table is sorted by the highest points and if the points are equal the highest goal difference
    @table = if params[:season_id].present?
               Table.includes(opponent_team: :team_badge_attachment)
                 .where(season_id: params[:season_id])
                 .order(Arel.sql('w * 3 + d DESC'), Arel.sql('gf - ga DESC'))
             else
               Table.includes(opponent_team: :team_badge_attachment)
                 .order(Arel.sql('w * 3 + d DESC'), Arel.sql('gf - ga DESC'))
             end
  end

  def show
    @table = Table.find(params[:id])
  end

  def new
    @table = Table.new
  end

  def create
    @table = Table.new(table_params)
    @table.user_id = current_user.id

    respond_to do |format|
      if @table.save
        format.html { redirect_to table_index_path(@table), notice: 'Table was successfully created.' }

      else
        format.html { redirect_to table_index_url, notice: 'Failure' }
      end
    end
  end

  def destroy
    @table = Table.find(params[:id])
    @table.delete
    respond_to do |format|
      format.html { redirect_to table_index_path, notice: 'Table was successfully deleted.' }
    end
  end

  def edit
    @table = Table.find(params[:id])
  end

  def update
    @table = Table.find(params[:id])
    respond_to do |format|
      if @table.update(table_params)
        format.html { redirect_to table_index_path, notice: 'Table was successfully updated.' }
      else
        format.html { redirect_to table_index_url, notice: 'Failure' }
      end
    end
  end

  private

  def table_params
    params.require(:table).permit(:w, :d, :l, :gf, :ga, :opponent_team_id, :season_id, :user_id)
  end
end
