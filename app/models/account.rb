class Account < ApplicationRecord
  belongs_to :bank
  belongs_to :holder
  has_many :checks, dependent: :delete_all


  # Validates
  validates :number, :bank_id, :holder_id, :agency_code,  presence: true

  #Scopes
  scope :to_user, -> (user){
             where(:holder_id => user) 
           }

  scope :to_user_valid, -> (user, account_id){
            select(:id).where(:holder_id => user).where(:id => account_id)
  }



  filterrific(
    available_filters: [
      :sorted_by,
      :search_query,
      :with_bank_name
    ]
  )
  
  scope :search_query, lambda { |query|
    return nil  if query.blank?

    # condition query, parse into individual keywords
    terms = query.to_s.downcase.split(/\s+/)

    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      ('%' + e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }

    num_or_conds = 4

    where(
      terms.map { |term|
        "(         accounts.id             LIKE ? 
                OR accounts.number         LIKE ?
                OR accounts.agency_code    LIKE ?
                OR accounts.bank_id        LIKE ?
              )"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds  }.flatten
    )

  }

  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^account_/
      order("accounts.number #{ direction }")
    when /^id_/
      order("accounts.id #{ direction }")
    when /^agency_/
      order("accounts.agency_code #{ direction }")
    when /^bank_/
      order("banks.bank_name #{ direction }").includes(:bank)

    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }


  def self.options_for_sorted_by
      [    
        ['Código (0-9)', 'id_asc'],
        ['Banco (a-z)', 'bank_asc'],
        ['Agencia (0-9)', 'agency_asc'],
        ['Conta (a-z)', 'account_asc']
      ]
  end


  def self.options_for_select
    order('number').map { |e| [e.number, e.id] }
  end

end
