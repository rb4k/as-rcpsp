class ProceduresController < ApplicationController
  respond_to :html, :json
  before_filter :signed_in_user
  # GET /Procedures
  # GET /Procedures.json
  def index
    @Procedures = Procedure.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @Procedures }
    end
  end

  # GET /Procedures/1
  # GET /Procedures/1.json
  def show
    @Procedure = Procedure.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @Procedure }
    end
  end

  # GET /Procedures/new
  # GET /Procedures/new.json
  def new
    @Procedure = Procedure.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @Procedure }
    end
  end

  # GET /Procedures/1/edit
  def edit
    @Procedure = Procedure.find(params[:id])
  end

  # POST /Procedures
  # POST /Procedures.json
  def create
    @Procedure = Procedure.new(params[:Procedure])
    @periods = Period.all
    respond_to do |format|
      if @Procedure.save
        @periods.each { |pe|
          ProcedurePeriod.create(Procedure_id: @Procedure.id, period_id: pe.id, demand: 0)
          }
        format.html { redirect_to @Procedure, notice: 'Vorgang wurde erfolgreich angelegt!' }
        format.json { render json: @Procedure, status: :created, location: @Procedure }
      else
        format.html { render action: "new" }
        format.json { render json: @Procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /Procedures/1
  # PUT /Procedures/1.json
  def update
    @Procedure = Procedure.find(params[:id])

    respond_to do |format|
      if @Procedure.update_attributes(params[:Procedure])
        format.html { redirect_to @Procedure, notice: 'Vorgang   wurde erfolgreich aktualisiert.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @Procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Procedures/1
  # DELETE /Procedures/1.json
  def destroy
    @Procedure = Procedure.find(params[:id])
    @Procedure.destroy

    respond_to do |format|
      format.html { redirect_to Procedures_url }
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