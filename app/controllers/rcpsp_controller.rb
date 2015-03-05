#encoding: UTF-8

class RcpspController < ApplicationController
  respond_to :html, :json
  before_filter :signed_in_user
  before_filter :current_user#, only: [:admin_user]

  def optimize

    if File.exist?("RCSPSP_Input.inc")
      File.delete("RCPSP_Input.inc")
    end
    f=File.new("RCPSP_Input.inc", "w")
    printf(f, "set i / \n")
    @procedures = Procedure.all
    @procedures.each { |proc| printf(f, proc.name + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "set t0*t200 /"+ "\n\n")


    printf(f, "set r / \n")
    @resources = Resource.all
    @resources.each { |res| printf(f, res.name + "\n") }
    printf(f, "/;\n\n")


    printf(f, "VN(h,i)=no;\n\n")

    @procedure_procedures = ProcedureProcedure.all
    @procedure_procedures.each { |proc_proc|
      printf(f, "VN('" + proc_proc.prepro.name+"','" + proc_proc.sucpro.name+"')=yes;\n")
    }

    printf(f, "\n")

    @procedures.each { |time|
      printf(f, "d('" + time.name + "')= "+ time.prot.to_s + ";\n")
    }

    printf(f, "\n")
    printf(f, "k(i,r)=0;\n\n")

    @procedure_resources = ProcedureResource.all
    @procedure_resources.each { |k|
      printf(f, "k('" + k.procedure.name + "','" + k.resource.name + "')= "+ k.procedure.kapabe.to_s + ";\n")
    }

    printf(f, "\n")

    @machines.each { |mac|
      printf(f, "oc('" + mac.name + "')= "+ mac.overtime_cost.to_s + ";\n")
    }

    printf(f, "\n")


    @machine_periods = MachinePeriod.all
    @machine_periods.each { |mac_per|
      printf(f, "C('" +mac_per.machine.name+"','t" + mac_per.period.name+"')= "+ mac_per.capacity.to_s + ";\n")
    }

    printf(f, "\n")


    @product_periods = ProductPeriod.all
    @product_periods.each { |pro_per|
      printf(f, "d('" +pro_per.product.name+"','t" + pro_per.period.name+"')= "+ pro_per.demand.to_s + ";\n")
    }


    f.close


    if File.exist?("MLClSP_solution.txt")
      File.delete("MLCLSP_solution.txt")
    end

    system "C:\\GAMS\\win64\\23.9\\gams RCPSP1"


    flash.now[:started] = "Die Rechnung wurde gestartet!"

    render 'static_pages/rcpsp_start'


  end

  def delete_old_plan
    if File.exist?("MLCLSP_solution_kt.txt")
      File.delete("MLCLSP_solution_kt.txt")
    end
    if File.exist?("MLCLSP_solution_jt.txt")
      File.delete("MLCLSP_solution_jt.txt")
    end
    if File.exist?("MLCLSP_ofv.txt")
      File.delete("MLCLSP_ofv.txt")
    end
    @product_periods = ProductPeriod.all
    @product_periods.each { |pro_per|
      pro_per.production=nil
      pro_per.inventory=nil
      pro_per.setup=nil
      pro_per.save
    }
    @machine_periods = MachinePeriod.all
    @machine_periods.each { |mac_per|
      mac_per.overtime=nil
      mac_per.save
    }
    @objective_function_value=nil
    render :template => "product_periods/index"
  end

  def read_optimization_results
    if (File.exist?("MLCLSP_solution_kt.txt") and File.exists?("MLCLSP_solution_jt.txt"))
      fi=File.open("MLCLSP_solution_kt.txt", "r")
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
      fi=File.open("MLCLSP_solution_jt.txt", "r")
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
  def read_and_show_ofv
    if File.exist?("MLCLSP_ofv.txt")
      fi=File.open("MLCLSP_ofv.txt", "r")
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

