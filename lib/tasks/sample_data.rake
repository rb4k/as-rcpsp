#encoding: UTF-8

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "example@railstutorial.org",
                         password: "foobar",
                         password_confirmation: "foobar",
                         capacity: 35,
                         resource_id: 1)
    admin.toggle!(:admin)


    User.create!(name: "Susi Sorglos",
                 email: "susi@sorglos.de",
                 password: "foobar",
                 password_confirmation: "foobar",
                 capacity: 40,
                 resource_id: 2)


    9.times do |n|
#      name = Faker::Name.name
      name = "Nutzer-#{n+1}"
      email = "example-#{n+1}@railstutorial.org"
      password = "password"
      capacity = rand(25..40)
      resource_id = rand(1..10)
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   capacity: capacity,
                   resource_id: resource_id)
    end



    (1..30).each do |n|
      name = "Beispielvorgang-#{n}"
      kapabe = n+5
      prot = n+1
      Procedure.create!(name: name,
                   kapabe: kapabe,
                   prot: prot)
    end

    (1..10).each do |n|
      name = "Ressource-#{n}"
      ocr = n+3
      cost = n+2
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

    ProPro21 = ProcedureProcedure.create!(prepro_id: 1, sucpro_id: 2)
    ProPro22 = ProcedureProcedure.create!(prepro_id: 1, sucpro_id: 3)
    ProPro23 = ProcedureProcedure.create!(prepro_id: 1, sucpro_id: 4)
    ProPro24 = ProcedureProcedure.create!(prepro_id: 2, sucpro_id: 5)
    ProPro25 = ProcedureProcedure.create!(prepro_id: 3, sucpro_id: 6)
    ProPro26 = ProcedureProcedure.create!(prepro_id: 4, sucpro_id: 7)
    ProPro27 = ProcedureProcedure.create!(prepro_id: 5, sucpro_id: 8)
    ProPro28 = ProcedureProcedure.create!(prepro_id: 6, sucpro_id: 8)
    ProPro29 = ProcedureProcedure.create!(prepro_id: 7, sucpro_id: 9)
    ProPro30 = ProcedureProcedure.create!(prepro_id: 8, sucpro_id: 10)
    ProPro31 = ProcedureProcedure.create!(prepro_id: 9, sucpro_id: 10)

    ProPro41 = ProcedureProcedure.create!(prepro_id: 1, sucpro_id: 2)
    ProPro42 = ProcedureProcedure.create!(prepro_id: 1, sucpro_id: 3)
    ProPro43 = ProcedureProcedure.create!(prepro_id: 1, sucpro_id: 4)
    ProPro44 = ProcedureProcedure.create!(prepro_id: 2, sucpro_id: 5)
    ProPro45 = ProcedureProcedure.create!(prepro_id: 3, sucpro_id: 6)
    ProPro46 = ProcedureProcedure.create!(prepro_id: 4, sucpro_id: 7)
    ProPro47 = ProcedureProcedure.create!(prepro_id: 5, sucpro_id: 8)
    ProPro48 = ProcedureProcedure.create!(prepro_id: 6, sucpro_id: 8)
    ProPro49 = ProcedureProcedure.create!(prepro_id: 7, sucpro_id: 9)
    ProPro50 = ProcedureProcedure.create!(prepro_id: 8, sucpro_id: 10)
    ProPro51 = ProcedureProcedure.create!(prepro_id: 9, sucpro_id: 10)

    (1..30).each do |n|
      procedure_id = n
      resource_id = rand(1..10)
      ProcedureResource.create!(resource_id: resource_id, procedure_id: procedure_id)
    end

  end
end