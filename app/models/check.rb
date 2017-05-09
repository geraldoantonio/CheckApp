class Check < ApplicationRecord
  belongs_to :account
  belongs_to :beneficiary

  monetize :amount_cents


  enum status: { undiscounted: 0, discounted: 1 }

  # Validates
  validates :number, :account_id, :date_discount, :beneficiary_id, :status, presence: true
  validates :amount, numericality: { greater_than: 0 }


 filterrific(
    default_filter_params: { sorted_by: 'date_discount_desc' },
    available_filters: [
      :sorted_by,
      :search_query,
      :with_beneficiary_id,
      :with_account_id,
      :with_date_discount_gte,
      :with_date_discount_lt
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

    num_or_conds = 3

    where(
      terms.map { |term|
        "(
            checks.id       LIKE ? OR 
            checks.number   LIKE ? OR 
            checks.amount_cents  LIKE ? 
          )"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds  }.flatten
    )

  }

  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^id_/
      order("checks.id #{ direction }")
    when /^agency/
      order("checks.agency_code #{ direction }")
    when /^account_/
      order("accounts.number #{ direction }").includes(:account)
    when /^bank_/
      order("bank.bank_name #{ direction }").includes(:bank)
    when /^number_/
      order("checks.number #{ direction }")
    when /^amount_/
      order("checks.amount_cents #{ direction }")
    when /^date_discount_/
      order("checks.date_discount #{ direction }")
    when /^status_/
      order("checks.status #{ direction }")

    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }


  scope :with_beneficiary_id, lambda { |beneficiary_ids|
    
  }
  scope :with_account_id, lambda { |account_ids|
  
  }
  scope :with_date_discount_gte,lambda { |reference_time|
    where('checks.date_discount >= ?', reference_time)
  }

  scope :with_date_discount_lt,lambda { |reference_time|
    where('checks.date_discount <= ?', reference_time)
  }
  def self.options_for_sorted_by
      [
        ['Código (0-9)', 'id_asc'],
        ['Conta (0-9)', 'account_asc'],
        ['Valor (maior-menor)', 'amount_desc'],
        ['Data ', 'date_discount_asc']
      ]
  end

end

