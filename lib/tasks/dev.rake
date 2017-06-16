namespace :dev do
  desc "TODO"
  task setup: :environment do

    puts ">>>> Executando o setup para desenvolvimento <<<<"
    puts ""
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
    #puts %x(rake dev:generate_holders)
    #puts ""
    puts %x(rake dev:generate_user_preferences)
    puts ""
    puts %x(rake dev:generate_beneficiaries)
    puts ""
    puts %x(rake dev:generate_accounts)
    puts ""
    puts %x(rake dev:generate_checks)
    puts ""

    puts ">>>>           Setup concluido             <<<<<"
    puts ""
    puts "Usuário padrão [ Login: admin@admin.com | Senha: 123456 ] "
    puts ""
    puts ""


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

    bar = RakeProgressbar.new(10)
      bar.inc
      10.times do
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
      ([1,1,2,3,4,5].sample).times do
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
      Random.rand(40).times do
        Check.create!(
          number: Random.rand(1000),
          account: account,
          amount: "#{Random.rand(2000)},#{Random.rand(999)}",
          beneficiary: Beneficiary.where(:holder_id => Account.find(account).holder_id).sample,
          date_discount: Date.today + Random.rand(90),
          status: [0,1].sample
        )
      end
    end

    bar.finished
  end

################################################################################
  desc "TODO"
  task generate_user_preferences:  :environment do

    puts "Gerando preferencias..."
    
    users = User.all
    bar = RakeProgressbar.new(users.length)

    users.each do |user|
      UserPreferences.find_or_create_by!(
        user: user,
        pagination_per_page: [5,8,10,15,20].sample,
        check_date_near: 6,
      
        email_type: "smtp",
        smtp_address:              "smtp.gmail.com",
        smtp_port:                 "587",
        smtp_domain:               "localhost",
        smtp_user:            Faker::Internet.email,
        smtp_password:             "123456",
        smtp_authentication:       "plain",
        smtp_enable_starttls_auto: "true"
      )
    end

    bar.finished
  end

  

################################################################################

end
