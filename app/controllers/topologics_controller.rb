class TopologicsController < ApplicationController
  respond_to :html, :json
  before_filter :signed_in_user
  # GET /procedure_procedures
  # GET /procedure_procedures.json
  def index
    @topologics = Topologic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topologics }
    end
  end

  # GET /procedure_procedures/1
  # GET /procedure_procedures/1.json
  def show
    @topologic = Topologic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topologic }
    end
  end

  # GET /procedure_procedures/new
  # GET /procedure_procedures/new.json
  def new
    @topologic = Topologic.new
  #  @procedure_procedure.build_from_procedure
  #  @procedure_procedure.build_to_procedure


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topologic }
    end
  end

  # GET /procedure_procedures/1/edit
  def edit
    @topologic = Topologic.find(params[:id])
  end

  # POST /procedure_procedures
  # POST /procedure_procedures.json
  def create
    @topologic = Topologic.new(params[:topologic])
    respond_to do |format|
      if @topologic.save
        format.html { redirect_to @topologic, notice: 'Vorgang wurde erfolgreich angelegt!' }
        format.json { render json: @topologic, status: :created, location: @topologic }
      else
        format.html { render action: "new" }
        format.json { render json: @topologic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /procedure_procedures/1
  # PUT /procedure_procedures/1.json
  def update
    @topologic = Topologic.find(params[:id])

    respond_to do |format|
      if @topologic.update_attributes(params[:topologic])
        format.html { redirect_to @topologic, notice: 'Vorgang wurde erfolgreich aktualisiert.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topologic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /procedure_procedures/1
  # DELETE /procedure_procedures/1.json
  def destroy
    @topologic = Topologic.find(params[:id])
    @topologic.destroy

    respond_to do |format|
      format.html { redirect_to topologics_url }
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