# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#    Character.create(name: 'Luke', movie: movies.first)

banks = ([
  {id: "654", bank_name: "Banco A.J.Renner S.A."},
  {id: "246", bank_name: "Banco ABC Brasil S.A."},
  {id: "075", bank_name: "Banco CR2 S.A."},
  {id: "121", bank_name: "Banco Agiplan S.A."},
  {id: "025", bank_name: "Banco Alfa S.A."},
  {id: "641", bank_name: "Banco Alvorada S.A."},
  {id: "065", bank_name: "Banco Patagon S.A."},
  {id: "213", bank_name: "Banco Arbi S.A."},
  {id: "024", bank_name: "Banco BANDEPE S.A."},
  {id: "740", bank_name: "Banco Barclays S.A."},
  {id: "107", bank_name: "Banco BBM S.A."},
  {id: "318", bank_name: "Banco BMG S.A."},
  {id: "752", bank_name: "Banco BNP Paribas Brasil S.A."},
  {id: "248", bank_name: "Banco Boavista Interatlântico S.A."},
  {id: "218", bank_name: "Banco Bonsucesso S.A."},
  {id: "069", bank_name: "Banco BPN Brasil S.A."},
  {id: "063", bank_name: "Ibibank S.A. - Banco Múltiplo"},
  {id: "036", bank_name: "Banco Bradesco BBI S.A. "},
  {id: "122", bank_name: "Banco Bradesco BERJ S.A."},
  {id: "204", bank_name: "Banco Bradesco Cartões S.A."},
  {id: "394", bank_name: "Banco Bradesco Financiamentos S.A."},
  {id: "237", bank_name: "Banco Bradesco S.A."},
  {id: "208", bank_name: "Banco BTG Pactual S.A."},
  {id: "263", bank_name: "Banco Cacique S.A."},
  {id: "473", bank_name: "Banco Financial Português S.A."},
  {id: "412", bank_name: "Banco Capital S.A."},
  {id: "040", bank_name: "Banco Cargill S.A."},
  {id: "266", bank_name: "Banco Cédula S.A."},
  {id: "739", bank_name: "Banco Cetelem S.A."},
  {id: "233", bank_name: "Banco Cifra S.A."},
  {id: "745", bank_name: "Banco Citibank S.A."},
  {id: "241", bank_name: "Banco Clássico S.A."},
  {id: "095", bank_name: "Banco Confidence de Câmbio S.A."},
  {id: "756", bank_name: "Banco Cooperativo do Brasil S.A. - BANCOOB"},
  {id: "748", bank_name: "Banco Cooperativo Sicredi S.A."},
  {id: "222", bank_name: "Banco Credit Agricole Brasil S.A."},
  {id: "505", bank_name: "Banco Credit Suisse (Brasil) S.A."},
  {id: "003", bank_name: "Banco da Amazônia S.A."},
  {id: "083", bank_name: "Banco da China Brasil S.A."},
  {id: "707", bank_name: "Banco Daycoval S.A."},
  {id: "300", bank_name: "Banco de La Nacion Argentina"},
  {id: "495", bank_name: "Banco de La Provincia de Buenos Aires"},
  {id: "494", bank_name: "Banco de La Republica Oriental del Uruguay"},
  {id: "456", bank_name: "Banco de Tokyo-Mitsubishi UFJ Brasil S.A."},
  {id: "001", bank_name: "Banco do Brasil S.A."},
  {id: "047", bank_name: "Banco do Estado de Sergipe S.A."},
  {id: "037", bank_name: "Banco do Estado do Pará S.A."},
  {id: "041", bank_name: "Banco do Estado do Rio Grande do Sul S.A."},
  {id: "004", bank_name: "Banco do Nordeste do Brasil S.A."},
  {id: "265", bank_name: "Banco Fator S.A."},
  {id: "224", bank_name: "Banco Fibra S.A."},
  {id: "626", bank_name: "Banco Ficsa S.A."},
  {id: "612", bank_name: "Banco Guanabara S.A."},
  {id: "012", bank_name: "Banco INBURSA de Investimentos S.A."},
  {id: "258", bank_name: "Banco Induscred S.A."},
  {id: "604", bank_name: "Banco Industrial do Brasil S.A."},
  {id: "653", bank_name: "Banco Indusval S.A."},
  {id: "630", bank_name: "Banco Intercap S.A."},
  {id: "249", bank_name: "Banco Investcred S.A."},
  {id: "184", bank_name: "Banco Itaú BBA S.A."},
  {id: "029", bank_name: "Banco Itaú BMG Consignado S.A."},
  {id: "479", bank_name: "Banco ItauBank S.A"},
  {id: "074", bank_name: "Banco J. Safra S.A."},
  {id: "376", bank_name: "Banco J. P. Morgan S.A."},
  {id: "217", bank_name: "Banco John Deere S.A."},
  {id: "076", bank_name: "Banco KDB S.A."},
  {id: "757", bank_name: "Banco KEB HANA do Brasil S.A."},
  {id: "600", bank_name: "Banco Luso Brasileiro S.A."},
  {id: "243", bank_name: "Banco Máxima S.A."},
  {id: "720", bank_name: "Banco Maxinvest S.A."},
  {id: "389", bank_name: "Banco Mercantil do Brasil S.A."},
  {id: "370", bank_name: "Banco Europeu para a America Latina (BEAL) S.A."},
  {id: "746", bank_name: "Banco Modal S.A."},
  {id: "066", bank_name: "Banco Morgan Stanley S.A."},
  {id: "007", bank_name: "Banco Nacional de Desenvolvimento Econômico e Social"},
  {id: "079", bank_name: "Banco Original do Agronegócio S.A."},
  {id: "212", bank_name: "Banco Original S.A."},
  {id: "712", bank_name: "Banco Ourinvest S.A."},
  {id: "623", bank_name: "Banco PAN S.A."},
  {id: "611", bank_name: "Banco Paulista S.A."},
  {id: "613", bank_name: "Banco Pecúnia S.A."},
  {id: "094", bank_name: "Banco Finaxis S.A."},
  {id: "643", bank_name: "Banco Pine S.A."},
  {id: "658", bank_name: "Banco Porto Real S.A."},
  {id: "747", bank_name: "Banco Rabobank International Brasil S.A."},
  {id: "633", bank_name: "Banco Rendimento S.A."},
  {id: "120", bank_name: "Banco Rodobens S.A."},
  {id: "422", bank_name: "Banco Safra S.A."},
  {id: "033", bank_name: "Banco Santander (Brasil) S.A."},
  {id: "743", bank_name: "Banco Semear S.A."},
  {id: "637", bank_name: "Banco Sofisa S.A."},
  {id: "464", bank_name: "Banco Sumitomo Mitsui Brasileiro S.A."},
  {id: "082", bank_name: "Banco Topázio S.A."},
  {id: "634", bank_name: "Banco Triângulo S.A."},
  {id: "018", bank_name: "Banco Tricury S.A."},
  {id: "655", bank_name: "Banco Votorantim S.A."},
  {id: "610", bank_name: "Banco VR S.A."},
  {id: "119", bank_name: "Banco Western Union do Brasil S.A."},
  {id: "124", bank_name: "Banco Woori Bank do Brasil S.A."},
  {id: "021", bank_name: "BANESTES S.A. Banco do Estado do Espírito Santo"},
  {id: "719", bank_name: "Banif-Banco Internacional do Funchal (Brasil)S.A."},
  {id: "755", bank_name: "Banco Merrill Lynch S.A."},
  {id: "081", bank_name: "BBN Banco Brasileiro de Negócios S.A."},
  {id: "496", bank_name: "Banco Uno - E Brasil S.A."},
  {id: "250", bank_name: "BCV - Banco de Crédito e Varejo S.A."},
  {id: "017", bank_name: "BNY Mellon Banco S.A."},
  {id: "126", bank_name: "BR Partners Banco de Investimento S.A."},
  {id: "070", bank_name: "BRB - Banco de Brasília S.A."},
  {id: "737", bank_name: "Banco Theca S.A."},
  {id: "225", bank_name: "Banco Brascan S.A."},
  {id: "211", bank_name: "Banco Sistema S.A."},
  {id: "104", bank_name: "Caixa Econômica Federal"},
  {id: "320", bank_name: "China Construction Bank (Brasil) Banco Múltiplo S.A."},
  {id: "477", bank_name: "Citibank N.A."},
  {id: "487", bank_name: "Deutsche Bank S.A. - Banco Alemão"},
  {id: "725", bank_name: "Finansinos S.A. - Crédito, Financ. e Investimento"},
  {id: "064", bank_name: "Goldman Sachs do Brasil Banco Múltiplo S.A."},
  {id: "078", bank_name: "Haitong Banco de Investimento do Brasil S.A."},
  {id: "062", bank_name: "Hipercard Banco Múltiplo S.A."},
  {id: "399", bank_name: "HSBC Bank Brasil S.A. - Banco Múltiplo"},
  {id: "132", bank_name: "ICBC do Brasil Banco Múltiplo S.A."},
  {id: "492", bank_name: "ING Bank N.V."},
  {id: "346", bank_name: "Banco Francês e Brasileiro S.A."},
  {id: "341", bank_name: "Itaú Unibanco S.A."},
  {id: "488", bank_name: "JPMorgan Chase Bank, National Association"},
  {id: "014", bank_name: "Natixis Brasil S.A. Banco Múltiplo"},
  {id: "753", bank_name: "Novo Banco Continental S.A. - Banco Múltiplo"},
  {id: "254", bank_name: "Paraná Banco S.A."},
  {id: "751", bank_name: "Scotiabank Brasil S.A. Banco Múltiplo"},
  {id: "129", bank_name: "UBS Brasil Banco de Investimento S.A."}
 ])

puts "Gerando lista de bancos..."

bar = RakeProgressbar.new(banks.length)
  bar.inc
  banks.each do |bank|
    Bank.find_or_create_by!(bank)
  end
bar.finished
################################################################################

puts "Gerando usuário padrão..."

  bar = RakeProgressbar.new(1)
  bar.inc
  user = User.new(
                    email: "admin@admin.com",
                 password: "123456", 
    password_confirmation: "123456"
  )
  user.build_holder
  user.holder.name = "Fábrica de Software"
  user.holder.cpf = "999.999.999-99"
  user.holder.cnpj = "99.999.999/0001-01"
  
  user.save!

bar.finished
################################################################################




