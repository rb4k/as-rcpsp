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
    @projects = Project.all
    @project = Project.find(1)

    @procedures.each { |proc|
      proc.fa=nil
      proc.sa=nil
      proc.fe=nil
      proc.se=nil
      proc.save
    }


    @projects.each { |projekt|
      projekt.zwc=nil
      projekt.save
    }

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
      printf(f, "k('" + k.procedure.name + "','" + k.resource.name + "')= "+ k.capa_demand.to_s + ";\n")
    }

    printf(f, "\n")

    @resources.each { |grenze|
      printf(f, "KP('" + grenze.name + "')= "+ User.sum(:capacity, :conditions => {:resource_id => grenze}).to_s + ";\n")
    }

    printf(f, "\n")

    printf(f, "Deadline= "+ Procedure.sum(:prot).to_s + ";\n")

    f.close


    if File.exist?("RCPSP1_solution.txt")
      File.delete("RCPSP1_solution.txt")
    end


    system @project.path.to_s +  " RCPSP1"

    redirect_to url_for(:controller => :rcpsps, :action => :solution)


    if (File.exist?("RCPSP1_solution_zeit.txt") and File.exists?("RCPSP1_solution_zw.txt"))

      fi=File.open("RCPSP1_solution_x.txt", "r")
      fi.each { |line|
      sa=line.split(";")
      if sa[0].to_i == 1
      sa0=sa[0]
      sa1=sa[1]
      sa2=sa[2].delete "t" + " \n"
      procedure=Procedure.find_by_name(sa1)
      procedure.crip = sa2
      procedure.save
      end
      }
      fi.close

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

      fi=File.open("RCPSP1_solution_zw.txt", "r")
      line=fi.readline
      fi.close
      sa=line.split(" ")
      sa0=sa[0]
      sa1=sa[1].delete " \n"
      project=Project.find_by_id(1)
      project.zwt = sa1
      project.save
    #else
     # flash.now[:not_available] = "Die Lösung wurde noch nicht berechnet!"
    end


  end

  def solution
    @procedures = Procedure.all
    @project = Project.find(1)
    until File.exist?("RCPSP1_solution_zeit.txt") and File.exists?("RCPSP1_solution_zw.txt")
      sleep( 5 )
    end

    render 'procedures/index'
  end

  def optimize2
    if File.exist?("RCPSP2_solution_x.txt")
      File.delete("RCPSP2_solution_x.txt")
    end
    if File.exist?("RCPSP2_solution_kosten.txt")
      File.delete("RCPSP2_solution_kosten.txt")
    end
    if File.exist?("RCPSP2_solution_zeit.txt")
      File.delete("RCPSP2_solution_zeit.txt")
    end
    if File.exist?("RCPSP2_solution_zw.txt")
      File.delete("RCPSP2_solution_zw.txt")
    end

    @resources = Resource.all
    @procedures = Procedure.all
    @procedure_procedures = ProcedureProcedure.all
    @procedure_resources = ProcedureResource.all
    @projects = Project.all
    @project = Project.find(1)

    @procedures.each { |proc|
      proc.fa=nil
      proc.sa=nil
      proc.fe=nil
      proc.se=nil
      proc.save
    }

    @projects.each { |projekt|
      projekt.zwt=nil
      projekt.save
    }

    @resources.each { |res|
      res.oce=nil
      res.save
    }

    if File.exist?("RCSPSP2_Input.inc")
      File.delete("RCPSP2_Input.inc")
    end
    f=File.new("RCPSP2_Input.inc", "w")

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
      printf(f, "k('" + k.procedure.name + "','" + k.resource.name + "')= "+ k.capa_demand.to_s + ";\n")
    }

    printf(f, "\n")

    @resources.each { |grenze|
      printf(f, "KP('" + grenze.name + "')= "+ User.sum(:capacity, :conditions => {:resource_id => grenze}).to_s + ";\n")
    }

    printf(f, "\n")

    @resources.each { |zusatz|
      printf(f, "oc('" + zusatz.name + "')= "+ zusatz.ocr.to_s + ";\n")
    }

    printf(f, "\n")

    deadline = (@project.deadline - @project.startdate).to_i

    printf(f, "Deadline=" + deadline.to_s + ";\n")


    f.close


    if File.exist?("RCPSP2_solution.txt")
      File.delete("RCPSP2_solution.txt")
    end


    system @project.path.to_s +  " RCPSP2"


    redirect_to url_for(:controller => :rcpsps, :action => :solution2)

    if (File.exist?("RCPSP2_solution_kosten.txt") and File.exists?("RCPSP2_solution_zw.txt"))

      fi=File.open("RCPSP2_solution_x.txt", "r")
      fi.each { |line|
        sa=line.split(";")
        if sa[0].to_i == 1
          sa0=sa[0]
          sa1=sa[1]
          sa2=sa[2].delete "t" + " \n"
          procedure=Procedure.find_by_name(sa1)
          procedure.crip = sa2
          procedure.save
        end
      }
      fi.close

      fi=File.open("RCPSP2_solution_kosten.txt", "r")
      fi.each { |line|
        sa=line.split(";")
        sa0=sa[0]
        sa1=sa[1].delete " \n"
        resource=Resource.find_by_name(sa0)
        resource.oce = sa1
        resource.save
      }
      fi.close
    end

    if (File.exist?("RCPSP2_solution_zeit.txt"))

      fi=File.open("RCPSP2_solution_zeit.txt", "r")
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
    end

    if File.exist?("RCPSP2_solution_zw.txt")
      fi=File.open("RCPSP2_solution_zw.txt", "r")
      line=fi.readline
      fi.close
      sa=line.split(" ")
      sa0=sa[0]
      sa1=sa[1].delete " \n"
      project=Project.find_by_id(1)
      project.zwc = sa1
      project.save
    end

  end

  def solution2
    @resources = Resource.all
    @project = Project.find(1)
    until File.exist?("RCPSP2_solution_zeit.txt") and File.exists?("RCPSP2_solution_zw.txt") and File.exist?("RCPSP2_solution_kosten.txt")
      sleep( 5 )
    end

    render 'resources/index'
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