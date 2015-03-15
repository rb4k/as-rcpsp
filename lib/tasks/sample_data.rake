#encoding: UTF-8

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "example@railstutorial.org",
                         password: "foobar",
                         password_confirmation: "foobar",
                         capacity: 2,
                         resource_id: 1)
    admin.toggle!(:admin)


    User.create!(name: "Susi Sorglos",
                 email: "susi@sorglos.de",
                 password: "foobar",
                 password_confirmation: "foobar",
                 capacity: 2,
                 resource_id: 1)


    (3..5).each do |n|
#      name = Faker::Name.name
      name = "Nutzer-#{n}"
      email = "example-#{n}@railstutorial.org"
      password = "password"
      capacity = 2
      resource_id = 1
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   capacity: capacity,
                   resource_id: resource_id)
    end

    (6..10).each do |n|
#      name = Faker::Name.name
      name = "Nutzer-#{n}"
      email = "example-#{n}@railstutorial.org"
      password = "password"
      capacity = 2
      resource_id = 2
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   capacity: capacity,
                   resource_id: resource_id)
    end


    (1..12).each do |n|
      name = "Beispielvorgang#{n}"
      prot = rand(2..5)
      Procedure.create!(name: name,
                   prot: prot)
    end

    (1..2).each do |n|
      name = "Ressource#{n}"
      ocr = rand(5..10)
      cost = rand(1..3)
      Resource.create!(name: name,
                   ocr: ocr,
                   cost: cost)
    end


    ProPro1 = ProcedureProcedure.create!(prepro_id: 1, sucpro_id: 2)
    ProPro2 = ProcedureProcedure.create!(prepro_id: 1, sucpro_id: 5)
    ProPro3 = ProcedureProcedure.create!(prepro_id: 1, sucpro_id: 8)
    ProPro4 = ProcedureProcedure.create!(prepro_id:  1, sucpro_id: 10)
    ProPro5 = ProcedureProcedure.create!(prepro_id: 2, sucpro_id: 3)
    ProPro6 = ProcedureProcedure.create!(prepro_id: 2, sucpro_id: 6)
    ProPro7 = ProcedureProcedure.create!(prepro_id: 3, sucpro_id: 4)
    ProPro8 = ProcedureProcedure.create!(prepro_id: 4, sucpro_id: 7)
    ProPro9 = ProcedureProcedure.create!(prepro_id: 4, sucpro_id: 12)
    ProPro10 = ProcedureProcedure.create!(prepro_id: 5, sucpro_id: 6)
    ProPro11 = ProcedureProcedure.create!(prepro_id: 6, sucpro_id: 7)
    ProPro12 = ProcedureProcedure.create!(prepro_id: 7, sucpro_id: 12)
    ProPro13 = ProcedureProcedure.create!(prepro_id: 8, sucpro_id: 9)
    ProPro14 = ProcedureProcedure.create!(prepro_id: 9, sucpro_id: 12)
    ProPro15 = ProcedureProcedure.create!(prepro_id: 10, sucpro_id: 11)
    ProPro16 = ProcedureProcedure.create!(prepro_id: 11, sucpro_id: 12)

    ProRes1 = ProcedureResource.create!(procedure_id: 1, resource_id: 1, capa_demand: 8)
    ProRes2  = ProcedureResource.create!(procedure_id: 2, resource_id: 1, capa_demand: 8)
    ProRes3 = ProcedureResource.create!(procedure_id: 3, resource_id: 2, capa_demand: 10)
    ProRes4 = ProcedureResource.create!(procedure_id: 4, resource_id: 1, capa_demand: 8)
    ProRes5 = ProcedureResource.create!(procedure_id: 5, resource_id: 2, capa_demand: 8)
    ProRes6 = ProcedureResource.create!(procedure_id: 6, resource_id: 1, capa_demand: 9)
    ProRes7 = ProcedureResource.create!(procedure_id: 7, resource_id: 1, capa_demand: 8)
    ProRes8 = ProcedureResource.create!(procedure_id: 8, resource_id: 2, capa_demand: 10)
    ProRes9 = ProcedureResource.create!(procedure_id: 9, resource_id: 1, capa_demand: 8)
    ProRes10 = ProcedureResource.create!(procedure_id: 10, resource_id: 1, capa_demand: 9)
    ProRes11 = ProcedureResource.create!(procedure_id: 11, resource_id: 1, capa_demand: 8)
    ProRes12 = ProcedureResource.create!(procedure_id: 12, resource_id: 1, capa_demand: 8)


    Proj1 = Project.create!(name: "test", path: "C:\\GAMS\\win64\\24.3\\gams", deadline: Time.zone.now + 19.days)

    #(1..10).each do |n|
      #procedure_id = n
      #resource_id = rand(1..5)
      #ProcedureResource.create!(resource_id: resource_id, procedure_id: procedure_id)
    #end

  end
end