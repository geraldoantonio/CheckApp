namespace :dev do
  desc "TODO"
  task setup: :environment do

    puts ">>>> Executando o setup para desenvolvimento <<<<"

      puts "Apagando Banco de Dados... #{%x(rake db:drop)}"
      puts ""
      puts "Criando Banco de Dados...  #{%x(rake db:create)}"
      puts ""
      puts %x(rake db:migrate)
      puts ""
      puts %x(rake erd)
      puts ""
      puts %x(rake db:seed)
      puts ""
      puts %x(rake dev:generate_holders)
      puts ""
      puts %x(rake dev:generate_beneficiaries)
      puts ""
      puts %x(rake dev:generate_accounts)
      puts ""
      puts %x(rake dev:generate_checks)
      puts ""

    puts ">>>>           Setup concluido             <<<<<"


  end
################################################################################
  desc "TODO"
  task generate_holders: :environment do

    puts "Gerando titular de contas..."

    bar = RakeProgressbar.new(10)
    10.times do
      bar.inc
      user = User.new(
                        email: Faker::Internet.email,
                     password: "123456", 
        password_confirmation: "123456"
      )
      user.build_holder
      user.holder.name = Faker::Name.name
      user.holder.cpf = Faker::CPF.pretty
      user.holder.cnpj = Faker::CNPJ.pretty
      
      user.save!
    end
    bar.finished

  end

################################################################################
  desc "TODO"
  task generate_beneficiaries: :environment do

    puts "Gerando beneficiários..."

    bar = RakeProgressbar.new(100)
      bar.inc
      100.times do
        Beneficiary.create!(
          name: Faker::Name.name,
          address: Faker::Address.street_address,
          phone_1: Faker::PhoneNumber.phone_number,
          phone_2: Faker::PhoneNumber.cell_phone,
          email: Faker::Internet.email,
          holder: Holder.all.sample
        )
      end
    bar.finished

  end

################################################################################
  desc "TODO"
  task generate_accounts: :environment do

    puts "Gerando contas..."

    holders = Holder.all
    bar = RakeProgressbar.new(holders.length)

    holders.each do |holder|
      bar.inc
      ([1,1,2,3].sample).times do
        Account.create!(
          number: Random.rand(1000...999999),
          bank: Bank.all.sample,
          holder: holder,
          agency_code: Random.rand(100...999),
        )
      end
    end

    bar.finished
  end

################################################################################
  desc "TODO"
  task generate_checks: :environment do
        puts "Gerando cheques..."

    accounts = Account.all
    bar = RakeProgressbar.new(accounts.length)

    accounts.each do |account|
      bar.inc
      Random.rand(20).times do
        Check.create!(
          number: Random.rand(1000),
          account: account,
          amount: "#{Random.rand(2000)},#{Random.rand(999)}",
          beneficiary: Beneficiary.all.sample,
          date_discount: Date.today + Random.rand(90)
        )
      end
    end

    bar.finished
  end

################################################################################
end
