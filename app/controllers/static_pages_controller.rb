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
end
