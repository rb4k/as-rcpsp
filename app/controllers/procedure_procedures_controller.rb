class ProcedureProceduresController < ApplicationController
    respond_to :html, :json
    before_filter :signed_in_user
    before_filter :admin_user

  def graph
    @procedure_procedures = ProcedureProcedure.all
    @project = Project.find(1)
    require 'rgl/adjacency'
    require 'rgl/dot'
    result = RGL::DirectedAdjacencyGraph.new
    @procedure_procedures.each { |x|
      result.add_edge  x.prepro.name, x.sucpro.name }
    result.write_to_graphic_file('png')
    require 'graphviz'
    GraphViz.parse( "graph.dot", :path => @project.gvp.to_s ).output(:png => "app/assets/images/graph.png", :path => @project.gvp.to_s)
  end

  def index
    @procedure_procedures = ProcedureProcedure.all
  end

  def show
  end

  def new
    @procedure_procedure = ProcedureProcedure.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @procedure_procedure }
    end
  end

  def edit
  end

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
        format.html { redirect_to procedure_procedures_path, notice: 'Relation wurde erfolgreich angelegt!' }
        format.json { render json: procedure_procedures_path, status: :created, location: @procedure_procedure }
        else
          @procedure_procedure.destroy
          sleep(5)
          format.html { redirect_to :back, notice: 'Zyklen sind in der Projektplanung nicht erlaubt!' }
          format.json { render json: @procedure_procedure.errors, status: :unprocessable_entity }
        end
      end
    end

  end

  def update
  end

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