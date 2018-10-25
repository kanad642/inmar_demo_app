class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = current_user.groups.paginate(:page => params[:page], :per_page => 3)
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find_by(id: params[:id], user_id: current_user.id)
    @group_contacts = @group.present? ? @group.group_contacts.paginate(:page => params[:page], :per_page => 3) : []
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path, notice: 'Group was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
    end
  end

  def update_status
    group = Group.find_by(id: params[:group_id])
    group.update_attributes(status: params[:status]) if group.present?
    redirect_to groups_url, notice: 'Group was successfully updated.'
  end

  # To search group
  def search_group
    if params[:search_field].eql?("status") && params[:search_field].present?
      @groups = current_user.groups.where(status: params[:search_element].downcase)
    else
      @groups = current_user.groups.where("#{params[:search_field]} LIKE ? ", "%#{params[:search_element]}%")
    end
    render :index
  end

  # To search group Contact
  def search_group_contacts
    @group = Group.find_by(id: params[:group_id])
    if params[:search_field].eql?("status") && params[:search_field].present?
      @group_contacts = @group.group_contacts.where(status: params[:search_element].downcase)
    else
      @group_contacts = @group.group_contacts.where("#{params[:search_field]} LIKE ? ", "%#{params[:search_element]}%")
    end
    render :show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find_by(id: params[:id])
      redirect_to root_path, notice: "Data not found" unless @group.present?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :status, :user_id, :group_desp)
    end
end
