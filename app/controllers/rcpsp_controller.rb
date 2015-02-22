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

    #@periods = Period.all
    #@periods.each { |per| printf(f, "t"+per.name + "\n") }
    #printf(f, "/" + "\n\n")


    printf(f, "set r / \n")
    @users = User.all
    @users.each { |us| printf(f, us.name + "\n") }
    printf(f, "/;\n\n")


    printf(f, "VN(h,i)=no;\n\n")

    @procedure_procedures = ProcedureProcedure.all
    @procedure_procedures.each { |proc_proc|
      printf(f, "VN('" + proc_proc.prepro.name+"','" + proc_proc.sucpro.name+"')=yes;\n")
    }

    printf(f, "\n")



    @procedure_users = ProcedureUser.all
    @procedure_users.each { |proc_us| printf(f, "KP('" + proc_us.procedure.name+"','" + proc_us.user.name+"')=yes;\n") }

    printf(f, "\n")

    printf(f, "a(k,i)=0;\n")

    @product_products = ProductProduct.all
    @product_products.each { |pro_pro|
      printf(f, "KK('" + pro_pro.from_product.name+"','" + pro_pro.to_product.name+"')=yes;\n")
      printf(f, "a('" + pro_pro.from_product.name+"','" + pro_pro.to_product.name+"')= "+ pro_pro.coefficient.to_s + ";\n")
    }

    printf(f, "\n")

    @products.each { |prod|
      printf(f, "ts('" + prod.name + "')= "+ prod.setup_time.to_s + ";\n")
      printf(f, "tp('" + prod.name + "')= "+ prod.processing_time.to_s + ";\n")
      printf(f, "s('" + prod.name + "')= "+ prod.setup_cost.to_s + ";\n")
      printf(f, "h('" + prod.name + "')= "+ prod.holding_cost.to_s + ";\n")
      printf(f, "y_0('" + prod.name + "')= "+ prod.initial_inventory.to_s + ";\n")
      printf(f, "z('" + prod.name + "')= "+ prod.lead_time_periods.to_s + ";\n")
      printf(f, "\n")

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

  end

