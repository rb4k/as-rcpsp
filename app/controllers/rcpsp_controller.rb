#encoding: UTF-8

class RcpspController < ApplicationController
  respond_to :html, :json
  before_filter :signed_in_user
  before_filter :current_user#, only: [:admin_user]

  def optimize

    if File.exist?("RCSPSP1_Input.inc")
      File.delete("RCPSP1_Input.inc")
    end
    f=File.new("RCPSP1_Input.inc", "w")

    @resources = Resource.all
    @procedures = Procedure.all
    @procedure_procedures = ProcedureProcedure.all
    @procedure_resources = ProcedureResource.all

    printf(f, "set r / \n")
    @resources.each { |res| printf(f, res.name + "\n") }
    printf(f, "/;" + "\n\n")

    printf(f, "set i / \n")
    @procedures.each { |proc| printf(f, proc.name + "\n") }
    printf(f, "/;" + "\n\n")

    printf(f, "set t / t0*t200 /;"+ "\n\n")

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

    system "C:\\GAMS\\win32\\24.3\\gams RCPSP1"


    flash.now[:started] = "Die Rechnung wurde gestartet!"

    render 'static_pages/rcpsp_start'


  end

  def delete_old_plan
    if File.exist?("RCPSP1_solution_vr.txt")
      File.delete("RCPSP1_solution_vr.txt")
    end
    if File.exist?("RCPSP1_solution_rr.txt")
      File.delete("RCPSP1_solution_rr.txt")
    end
    if File.exist?("RCPSP1_zw.txt")
      File.delete("RCPSP1_zw.txt")
    end
    #@product_periods = ProductPeriod.all
    #@product_periods.each { |pro_per|
     # pro_per.production=nil
     # pro_per.inventory=nil
     # pro_per.setup=nil
     # pro_per.save
    #}
    #@machine_periods = MachinePeriod.all
    #@machine_periods.each { |mac_per|
    #  mac_per.overtime=nil
    #  mac_per.save
    #}
    #@objective_function_value=nil
    #render :template => "product_periods/index"
  end

  def read_optimization_results
    if (File.exist?("RCPSP1_solution_vr.txt") and File.exists?("RCPSP1_solution_vr.txt"))
      fi=File.open("RCPSP1_solution_vr.txt", "r")
      fi.each { |line|
        sa=line.split(";")
        sa0=sa[0].delete "kta "
        sa3=sa[3]
        sa4=sa[4]
        sa5=sa[5].delete " \n"
        product_period=ProductPeriod.find_by_id(sa0)
        product_period.production = sa3
        product_period.inventory = sa4
        product_period.setup = sa5
        product_period.save
      }
      fi.close
      fi=File.open("RCPSP1_solution_rr.txt", "r")
      fi.each { |line|
        sa=line.split(";")
        sa0=sa[0].delete "jta "
        sa3=sa[3].delete " \n"
        machine_period=MachinePeriod.find_by_id(sa0)
        machine_period.overtime = sa3
        machine_period.save
      }
      fi.close
    else
      flash.now[:not_available] = "Die Lösung wurde noch nicht berechnet!"
    end
    @product_periods = ProductPeriod.all
    render :template => "product_periods/index"
  end
  def read_and_show_zw
    if File.exist?("MLCLSP_zw.txt")
      fi=File.open("MLCLSP_ofv.zw", "r")
      line=fi.readline
      fi.close
      sa=line.split(" ")
      @objective_function_value=sa[1]
    else
      @objective_function_value=nil
      flash.now[:not_available] = "Zielfunktionswert wurde noch nicht berechnet!"
    end
    @product_periods = ProductPeriod.all
    render :template => "product_periods/index"
  end

  end

private
def signed_in_user
  unless signed_in?
    store_location
    redirect_to signin_path, notice: "Bitte melden Sie sich an."
  end
end