class ProcedureUsersController < ApplicationController
  respond_to :html, :json
  before_filter :signed_in_user
  # GET /procedure_users
  # GET /procedure_users.json
  def index
    @procedure_users = ProcedureUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @procedure_users }
    end
  end

  # GET /procedure_users/1
  # GET /procedure_users/1.json
  def show
    @procedure_user = ProcedureUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @procedure_user }
    end
  end

  # GET /procedure_users/new
  # GET /procedure_users/new.json
    def new
      @procedure_user = ProcedureUser.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @procedure_user }
      end
    end

  # GET /procedure_users/1/edit
  def edit
    @procedure_user = ProcedureUser.find(params[:id])
  end

  # POST /procedure_users
  # POST /procedure_users.json
    def create
      @procedure_user = ProcedureUser.new(params[:procedure_user])

      respond_to do |format|
        if @procedure_user.save
          format.html { redirect_to @procedure_user, notice: 'Vorgang wurde erfolgreich angelegt!' }
          format.json { render json: @procedure_user, status: :created, location: @procedure_user }
        else
          format.html { render action: "new" }
          format.json { render json: @procedure_user.errors, status: :unprocessable_entity }
        end
      end
    end

  # PUT /procedure_users/1
  # PUT /procedure_users/1.json
  def update
    @procedure_user = ProcedureUser.find(params[:id])

    respond_to do |format|
      if @procedure_user.update_attributes(params[:procedure_user])
        format.html { redirect_to @procedure_user, notice: 'Vorgang-Mitarbeiter-Relation wurde erfolgreich aktualisiert.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @procedure_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /procedure_users/1
  # DELETE /procedure_users/1.json
    def destroy
      @procedure_user = ProcedureUser.find(params[:id])
      @procedure_user.destroy

     respond_to do |format|
       format.html { redirect_to procedure_users_url }
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