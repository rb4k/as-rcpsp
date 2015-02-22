#encoding: UTF-8

class RcpspController < ApplicationController
  respond_to :html, :json
  before_filter :signed_in_user
  before_filter :current_user#, only: [:admin]

  def optimize

    if File.exist?("MLCLSP_Input.inc")
      File.delete("MLCLSP_Input.inc")
    end
    f=File.new("MLCLSP_Input.inc", "w")
    printf(f, "set k / \n")
    @products = Product.all
    @products.each { |prod| printf(f, prod.name + "\n") }
    printf(f, "/" + "\n\n")

    printf(f, "set t / \n")
    @periods = Period.all
    @periods.each { |per| printf(f, "t"+per.name + "\n") }
    printf(f, "/" + "\n\n")


    printf(f, "set j / \n")
    @machines = Machine.all
    @machines.each { |mac| printf(f, mac.name + "\n") }
    printf(f, "/;\n\n")


    printf(f, "KT(k,t)=yes;\n")
    printf(f, "JT(j,t)=yes;\n\n")
    printf(f, "KJ(k,j)=no;\n")
    printf(f, "KK(k,k)=no;\n\n")

    printf(f, "set kta / \n")
    @product_periods = ProductPeriod.all
    @product_periods.each { |prod_per| printf(f, "kta" + prod_per.id.to_s + "\n") }
    printf(f, "/;" + "\n\n")

    printf(f, "KTaKT(kta,k,t)=no;" + "\n\n")
    @product_periods.each { |prod_per| printf(f, "KTaKT('kta" + prod_per.id.to_s + "','" + prod_per.product.name + "','t" + prod_per.period.name + "')=yes;\n") }
    printf(f, "\n\n")


    printf(f, "set jta / \n")
    @machine_periods = MachinePeriod.all
    @machine_periods.each { |mac_per| printf(f, "jta" + mac_per.id.to_s + "\n") }
    printf(f, "/;" + "\n\n")

    printf(f, "JTaJT(jta,j,t)=no;" + "\n\n")
    @machine_periods.each { |mac_per| printf(f, "JTaJT('jta" + mac_per.id.to_s + "','" + mac_per.machine.name + "','t" + mac_per.period.name + "')=yes;\n") }
    printf(f, "\n\n")


    @product_machines = ProductMachine.all
    @product_machines.each { |pro_mac| printf(f, "KJ('" + pro_mac.product.name+"','" + pro_mac.machine.name+"')=yes;\n") }

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

