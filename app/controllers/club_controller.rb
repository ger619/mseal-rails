class ClubController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @clubs = Club.all.order('created_at DESC')
  end

  def show
    @clubs = Club.find(params[:id])
  end

  def create
    @clubs = Club.new(clubs_params)
    @clubs.user_id = current_user.id

    respond_to do |format|
      if @clubs.save
        format.html { redirect_to club_index_path(@clubs), notice: 'News was successfully created.' }
      else
        format.html { redirect_to club_index_path, notice: 'Failure' }
      end
    end
  end

  def edit
    @clubs = Club.find(params[:id])
  end

  def update
    @clubs = Club.find(params[:id])
    @clubs.user_id = current_user.id
    respond_to do |format|
      if @clubs.update(clubs_params)
        format.html { redirect_to club_index_path(@clubs), notice: 'Clubs was successfully updated.' }
      else
        format.html { redirect_to club_index_path, notice: 'Failure' }
      end
    end
  end

  def destroy
    @clubs = Club.find(params[:id])
    @clubs.user_id = current_user.id
    @clubs.delete

    respond_to do |format|
      format.html { redirect_to club_index_path, notice: 'News was successfully deleted.' }
    end
  end

  private

  def clubs_params
    params.permit(:header, :body, :photo, :user_id)
  end
end
