class ResourcesController < ApplicationController
  respond_to :html, :json
  before_filter :signed_in_user, only: [:edit, :update, :new, :create, :destroy]
  before_filter :admin_user, only: [:edit, :update, :new, :create, :destroy]
# GET /resources
# GET /resources.json
  def index
    @resources = Resource.all
    @procedures = Procedure.all
    @project = Project.find(1)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resources }
    end
  end
# GET /resources/1
# GET /resources/1.json
  def show
    @resource = Resource.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resource }
    end
  end
# GET /resources/new
# GET /resources/new.json
  def new
    @resource = Resource.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource }
    end
  end
# GET /resources/1/edit
  def edit
    @resource = Resource.find(params[:id])
  end
# POST /resources
# POST /resources.json
  def create
    @resource = Resource.new(params[:resource])
    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Ressource wurde angelegt' }
        format.json { render json: @resource, status: :created, location: @resource }
      else
        format.html { render action: "new" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end
# PUT /resources/1
# PUT /resources/1.json
  def update
    @resource = Resource.find(params[:id])
    respond_to do |format|
      if @resource.update_attributes(params[:resource])
        format.html { redirect_to @resource, notice: 'Ressource wurde aktualisiert' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end
# DELETE /resources/1
# DELETE /resources/1.json
  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url }
      format.json { head :no_content }
    end
  end

  private

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to(root_path)
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

end
