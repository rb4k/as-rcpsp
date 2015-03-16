class ProcedureProceduresController < ApplicationController
    respond_to :html, :json
    before_filter :signed_in_user
  before_filter :admin_user
# GET /procedure_procedures
# GET /procedure_procedures.json
  def index
    @procedure_procedures = ProcedureProcedure.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @procedure_procedures }
    end
  end
# GET /procedure_procedures/1
# GET /procedure_procedures/1.json
  def show
  end
# GET /procedure_procedures/new
# GET /procedure_procedures/new.json
  def new
    @procedure_procedure = ProcedureProcedure.new
# @procedure_procedure.build_from_procedure
# @procedure_procedure.build_to_procedure
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @procedure_procedure }
    end
  end
# GET /procedure_procedures/1/edit


  def edit
  end
# POST /procedure_procedures
# POST /procedure_procedures.json
  def create
  require 'rgl/adjacency'
  require 'rgl/topsort'
  @procedure_procedure = ProcedureProcedure.new(params[:procedure_procedure])
    respond_to do |format|
      if @procedure_procedure.save
        result = RGL::DirectedAdjacencyGraph.new
        ProcedureProcedure.all.each { |x|
          result.add_edge x.prepro_id, x.sucpro_id }
        if result.acyclic? == true
        format.html { redirect_to @procedure_procedure, notice: 'Relation wurde erfolgreich angelegt!' }
        format.json { render json: @procedure_procedure, status: :created, location: @procedure_procedure }
        else
          @procedure_procedure.destroy
          format.html { redirect_to :back, notice: 'Zyklen sind in der Projektplanung nicht erlaubt!' }
          format.json { render json: @procedure_procedure.errors, status: :unprocessable_entity }
        end
      end
    end

  end
# PUT /procedure_procedures/1
# PUT /procedure_procedures/1.json
  def update
  end
# DELETE /procedure_procedures/1
# DELETE /procedure_procedures/1.json
  def destroy
    @procedure_procedure = ProcedureProcedure.find(params[:id])
    @procedure_procedure.destroy
    respond_to do |format|
      format.html { redirect_to procedure_procedures_url }
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