class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  def rcpsp
    @project = Project.find(1)
  end

  def load
  @procedures = Procedure.all
  @project = Project.find(1)
  until File.exist?("RCPSP1_solution_zeit.txt") and File.exists?("RCPSP1_solution_zw.txt")
    sleep( 5 )
  end

    render 'procedures/index'
  end
end
