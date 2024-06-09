class ClubController < ApplicationController
  load_and_authorize_resource except: %i[index show]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @club = Club.all.order('created_at DESC')
  end

  def show
    @club = Club.find(params[:id])
  end

  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    @club.user_id = current_user.id

    respond_to do |format|
      if @club.save
        format.html { redirect_to club_index_path(@club), notice: 'News was successfully created.' }
      else
        format.html { redirect_to club_index_path, notice: 'Failure' }
      end
    end
  end

  def edit
    @club = Club.find(params[:id])
  end

  def update
    @club = Club.find(params[:id])
    @club.user_id = current_user.id
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to club_index_path(@club), notice: 'Clubs was successfully updated.' }
      else
        format.html { redirect_to club_index_path, notice: 'Failure' }
      end
    end
  end

  def destroy
    @club = Club.find(params[:id])
    @club.user_id = current_user.id
    @club.delete

    respond_to do |format|
      format.html { redirect_to club_index_path, notice: 'News was successfully deleted.' }
    end
  end

  private
  def club_params
    params.require(:club).permit(:header, :content, :photo, :user_id)
  end
end
