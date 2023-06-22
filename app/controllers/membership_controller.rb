class MembershipController < ApplicationController

  def index
  end

  def show
    @membership = Membership.find(params[:id])
  end

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.new(membership_params)
    respond_to do |format|
      if @membership.save
        format.html { redirect_to membership_index_url(@membership), notice: 'Membership was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity, notice: 'Failure' }
      end
    end
  end

  def destroy
    @membership = Membership.find(params[:id])
    @membership.delete
    respond_to do |format|
      format.html { redirect_to membership_index_url, notice: 'Membership was successfully deleted.' }
    end
  end

  private

  def membership_params
    params.permit(:type_of_membership, :title, :country, :date_of_birth, :email, :phone_number, :photo)
  end
end
