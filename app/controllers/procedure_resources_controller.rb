class ProcedureResourcesController < ApplicationController
  respond_to :html, :json
  before_filter :signed_in_user
  # GET /procedure_resources
  # GET /procedure_resources.json
  def index
    @procedure_resources = ProcedureResource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @procedure_resources }
    end
  end

  # GET /procedure_resources/1
  # GET /procedure_resources/1.json
  def show
    @procedure_resource = ProcedureResource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @procedure_resource }
    end
  end

  # GET /procedure_resources/new
  # GET /procedure_resources/new.json
    def new
      @procedure_resource = ProcedureResource.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @procedure_resource }
      end
    end

  # GET /procedure_resources/1/edit
  def edit
    @procedure_resource = ProcedureResource.find(params[:id])
  end

  # POST /procedure_resources
  # POST /procedure_resources.json
    def create
      @procedure_resource = ProcedureResource.new(params[:procedure_resource])

      respond_to do |format|
        if @procedure_resource.save
          format.html { redirect_to @procedure_resource, notice: 'Vorgangs-Ressourcen-Relation wurde erfolgreich angelegt!' }
          format.json { render json: @procedure_resource, status: :created, location: @procedure_resource }
        else
          format.html { render action: "new" }
          format.json { render json: @procedure_resource.errors, status: :unprocessable_entity }
        end
      end
    end

  # PUT /procedure_resources/1
  # PUT /procedure_resources/1.json
  def update
    @procedure_resource = ProcedureResource.find(params[:id])

    respond_to do |format|
      if @procedure_resource.update_attributes(params[:procedure_resource])
        format.html { redirect_to @procedure_resource, notice: 'Vorgang-Ressourcen-Relation wurde erfolgreich aktualisiert.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @procedure_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /procedure_resources/1
  # DELETE /procedure_resources/1.json
    def destroy
      @procedure_resource = ProcedureResource.find(params[:id])
      @procedure_resource.destroy

     respond_to do |format|
       format.html { redirect_to procedure_resources_url }
       format.json { head :no_content }
     end
   end


end

private

def signed_in_user
  unless signed_in?
    store_location
    redirect_to signin_path, notice: "Bitte melden Sie sich an."
  end
end