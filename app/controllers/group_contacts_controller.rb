class GroupContactsController < ApplicationController
  before_action :set_group_contact, only: [:edit, :update, :destroy]

  def new
  	@group_contact = GroupContact.new
  end

  def create
    @group_contact = GroupContact.new(group_contact_params)
    respond_to do |format|
      if @group_contact.save
        format.html { redirect_to group_path(params[:group_contact][:group_id]), notice: 'Group Contact was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @group_contact.update(group_contact_params)
        format.html { redirect_to group_path(@group_contact.group_id), notice: 'Group Contact was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @group_contact.destroy
    respond_to do |format|
      format.html { redirect_to group_path(@group_contact.group_id), notice: 'Group Contact was successfully destroyed.' }
    end
  end

  def update_status
    group_contact = GroupContact.find_by(id: params[:group_contact_id])
    group_contact.update_attributes(status: params[:status]) if group_contact.present?
    redirect_to group_path(group_contact.group_id), notice: 'Group Contact was successfully updated.'
  end

  private

  def set_group_contact
    @group_contact = GroupContact.find_by(id: params[:id], user_id: current_user.id)
    redirect_to root_path, notice: "Data not found" unless @group_contact.present?
  end

  def group_contact_params
	params.require(:group_contact).permit(:name, :email, :phone, :status, :group_id,:user_id)
  end
end
