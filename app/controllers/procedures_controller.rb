class ProceduresController < ApplicationController
  respond_to :html, :json
  before_filter :signed_in_user
  before_filter :admin_user
# GET /procedures
# GET /procedures.json
  def index
    @procedures = Procedure.all
    @project = Project.find(1)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @procedures }
    end
  end
# GET /procedures/1
# GET /procedures/1.json
  def show
    @procedure = Procedure.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @procedure }
    end
  end
# GET /procedures/new
# GET /procedures/new.json
  def new
    @procedure = Procedure.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @procedure }
    end
  end
# GET /procedures/1/edit
  def edit
    @procedure = Procedure.find(params[:id])
  end
# POST /procedures
# POST /procedures.json
  def create
    @procedure = Procedure.new(params[:procedure])
    respond_to do |format|
      if @procedure.save
        format.html { redirect_to @procedure, notice: 'Vorgang wurde angelegt' }
        format.json { render json: @procedure, status: :created, location: @procedure }
      else
        format.html { render action: "new" }
        format.json { render json: @procedure.errors, status: :unprocessable_entity }
      end
    end
  end
# PUT /procedures/1
# PUT /procedures/1.json
  def update
    @procedure = Procedure.find(params[:id])
    respond_to do |format|
      if @procedure.update_attributes(params[:procedure])
        format.html { redirect_to @procedure, notice: 'Vorgang wurde aktualisiert' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @procedure.errors, status: :unprocessable_entity }
      end
    end
  end
# DELETE /procedures/1
# DELETE /procedures/1.json
  def destroy
    @procedure = Procedure.find(params[:id])
    @procedure.destroy
    respond_to do |format|
      format.html { redirect_to procedures_url }
      format.json { head :no_content }
    end
  end

  private

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Bitte anmelden."
    end
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

end