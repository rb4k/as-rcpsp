#encoding: UTF-8

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "example@railstutorial.org",
                         password: "foobar",
                         password_confirmation: "foobar",
                         capacity: rand(10..15),
                         resource_id: 1)
    admin.toggle!(:admin)


    User.create!(name: "Susi Sorglos",
                 email: "susi@sorglos.de",
                 password: "foobar",
                 password_confirmation: "foobar",
                 capacity: rand(10..15),
                 resource_id: 2)


    (3..10).each do |n|
#      name = Faker::Name.name
      name = "Nutzer-#{n}"
      email = "example-#{n}@railstutorial.org"
      password = "password"
      capacity = rand(1..5)
      resource_id = rand(1..5)
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   capacity: capacity,
                   resource_id: resource_id)
    end



    (1..10).each do |n|
      name = "Beispielvorgang#{n}"
      kapabe = rand(1..2)
      prot = rand(1..5)
      Procedure.create!(name: name,
                   kapabe: kapabe,
                   prot: prot)
    end

    (1..5).each do |n|
      name = "Ressource#{n}"
      ocr = rand(3..5)
      cost = rand(1..3)
      Resource.create!(name: name,
                   ocr: ocr,
                   cost: cost)
    end


    ProPro1 = ProcedureProcedure.create!(prepro_id: 1, sucpro_id: 2)
    ProPro2 = ProcedureProcedure.create!(prepro_id: 1, sucpro_id: 3)
    ProPro3 = ProcedureProcedure.create!(prepro_id: 1, sucpro_id: 4)
    ProPro4 = ProcedureProcedure.create!(prepro_id: 2, sucpro_id: 5)
    ProPro5 = ProcedureProcedure.create!(prepro_id: 3, sucpro_id: 6)
    ProPro6 = ProcedureProcedure.create!(prepro_id: 4, sucpro_id: 7)
    ProPro7 = ProcedureProcedure.create!(prepro_id: 5, sucpro_id: 8)
    ProPro8 = ProcedureProcedure.create!(prepro_id: 6, sucpro_id: 8)
    ProPro9 = ProcedureProcedure.create!(prepro_id: 7, sucpro_id: 9)
    ProPro10 = ProcedureProcedure.create!(prepro_id: 8, sucpro_id: 10)
    ProPro11 = ProcedureProcedure.create!(prepro_id: 9, sucpro_id: 10)

    ProRes1 = ProcedureResource.create!(procedure_id: 1, resource_id: 1)
    ProRes2  = ProcedureResource.create!(procedure_id: 2, resource_id: 2)
    ProRes3 = ProcedureResource.create!(procedure_id: 3, resource_id: 3)
    ProRes4 = ProcedureResource.create!(procedure_id: 4, resource_id: 4)
    ProRes5 = ProcedureResource.create!(procedure_id: 5, resource_id: 5)
    ProRes6 = ProcedureResource.create!(procedure_id: 6, resource_id: 1)
    ProRes7 = ProcedureResource.create!(procedure_id: 7, resource_id: 2)
    ProRes8 = ProcedureResource.create!(procedure_id: 8, resource_id: 3)
    ProRes9 = ProcedureResource.create!(procedure_id: 9, resource_id: 4)
    ProRes10 = ProcedureResource.create!(procedure_id: 10, resource_id: 5)


    Proj1 = Project.create!(name: "test", path: "C:\\GAMS\\win64\\24.3\\gams", deadline: Time.zone.parse('2015-07-11'))

    #(1..10).each do |n|
      #procedure_id = n
      #resource_id = rand(1..5)
      #ProcedureResource.create!(resource_id: resource_id, procedure_id: procedure_id)
    #end

  end
end