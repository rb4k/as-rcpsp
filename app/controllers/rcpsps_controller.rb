#encoding: UTF-8

class RcpspsController < ApplicationController
  respond_to :html, :json
  before_filter :signed_in_user
  before_filter :admin_user

  def optimize
    if File.exist?("RCPSP1_solution_x.txt")
      File.delete("RCPSP1_solution_x.txt")
    end
    if File.exist?("RCPSP1_solution_zeit.txt")
      File.delete("RCPSP1_solution_zeit.txt")
    end
    if File.exist?("RCPSP1_solution_zw.txt")
      File.delete("RCPSP1_solution_zw.txt")
    end

    @resources = Resource.all
    @procedures = Procedure.all
    @procedure_procedures = ProcedureProcedure.all
    @procedure_resources = ProcedureResource.all

    @procedures.each { |proc|
      proc.fa=nil
      proc.sa=nil
      proc.fe=nil
      proc.se=nil
      proc.save
    }

    @objective_function_value=nil


    if File.exist?("RCSPSP1_Input.inc")
      File.delete("RCPSP1_Input.inc")
    end
    f=File.new("RCPSP1_Input.inc", "w")

    printf(f, "set r / \n")
    @resources.each { |res| printf(f, res.name + "\n") }
    printf(f, "/;" + "\n\n")

    printf(f, "set i / \n")
    @procedures.each { |proc| printf(f, proc.name + "\n") }
    printf(f, "/;" + "\n\n")

    printf(f, "set t / t0*t")
    printf(f, Procedure.sum(:prot).to_s)
    printf(f, " /;"+ "\n\n")

    printf(f, "VN(h,i)=no;\n\n")


    @procedure_procedures.each { |proc_proc|
      printf(f, "VN('" + proc_proc.prepro.name+"','" + proc_proc.sucpro.name+"')=yes;\n")
    }

    printf(f, "\n")

    @procedures.each { |time|
      printf(f, "d('" + time.name + "')= "+ time.prot.to_s + ";\n")
    }

    printf(f, "\n")
    printf(f, "k(i,r)=0;\n\n")

    @procedure_resources.each { |k|
      printf(f, "k('" + k.procedure.name + "','" + k.resource.name + "')= "+ k.procedure.kapabe.to_s + ";\n")
    }

    printf(f, "\n")

    @resources.each { |grenze|
      printf(f, "KP('" + grenze.name + "')= "+ User.sum(:capacity, :conditions => {:resource_id => grenze}).to_s + ";\n")
    }

    printf(f, "\n")


    f.close


   if File.exist?("RCPSP1_solution.txt")
     File.delete("RCPSP1_solution.txt")
    end

    #system "C:\\GAMS\\win32\\24.3\\gams RCPSP1"
    system "C:\\GAMS\\win64\\24.3\\gams RCPSP1"

    flash.now[:started] = "Die Rechnung wurde gestartet!"

    render 'static_pages/rcpsp'


  end


  def read_optimization_results
    @procedures = Procedure.all

    if (File.exist?("RCPSP1_solution_zeit.txt") and File.exists?("RCPSP1_solution_zw.txt"))

      fi=File.open("RCPSP1_solution_zeit.txt", "r")
      fi.each { |line|
        sa=line.split(";")
        sa0=sa[0]
        sa1=sa[1]
        sa2=sa[2]
        sa3=sa[3]
        sa4=sa[4].delete " \n"
        procedure=Procedure.find_by_name(sa0)
        procedure.fa = sa1
        procedure.sa = sa2
        procedure.fe = sa3
        procedure.se = sa4
        procedure.save
      }
      fi.close
    else
      flash.now[:not_available] = "Die Lösung wurde noch nicht berechnet!"
    end
    if File.exist?("RCPSP1_solution_zw.txt")
      fi=File.open("RCPSP1_solution_zw.txt", "r")
      line=fi.readline
      fi.close
      sa=line.split(" ")
      @objective_function_value=sa[1]
    else
      @objective_function_value=nil
      flash.now[:not_available] = "Zielfunktionswert wurde noch nicht berechnet!"
    end

    flash.now[:started] = "Ergebnisse eingelesen!"

    render :template => "static_pages/rcpsp"
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