class HallOfFamesController < ApplicationController
  before_action :set_hall_of_fame, only: %i[show edit update destroy]

  # GET /hall_of_fames or /hall_of_fames.json
  def index
    @hall_of_fames = HallOfFame.all
  end

  # GET /hall_of_fames/1 or /hall_of_fames/1.json
  def show; end

  # GET /hall_of_fames/new
  def new
    @hall_of_fame = HallOfFame.new
  end

  # GET /hall_of_fames/1/edit
  def edit; end

  # POST /hall_of_fames or /hall_of_fames.json
  def create
    @hall_of_fame = HallOfFame.new(hall_of_fame_params)

    respond_to do |format|
      if @hall_of_fame.save
        format.html { redirect_to hall_of_fame_url(@hall_of_fame), notice: 'Hall of fame was successfully created.' }
        format.json { render :show, status: :created, location: @hall_of_fame }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hall_of_fame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hall_of_fames/1 or /hall_of_fames/1.json
  def update
    respond_to do |format|
      if @hall_of_fame.update(hall_of_fame_params)
        format.html { redirect_to hall_of_fame_url(@hall_of_fame), notice: 'Hall of fame was successfully updated.' }
        format.json { render :show, status: :ok, location: @hall_of_fame }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hall_of_fame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hall_of_fames/1 or /hall_of_fames/1.json
  def destroy
    @hall_of_fame.destroy

    respond_to do |format|
      format.html { redirect_to hall_of_fames_url, notice: 'Hall of fame was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_hall_of_fame
    @hall_of_fame = HallOfFame.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def hall_of_fame_params
    params.require(:hall_of_fame).permit(:team_id)
  end
end
