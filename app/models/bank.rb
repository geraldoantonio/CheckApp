class Bank < ApplicationRecord
    
  validates :id, :bank_name, uniqueness: { case_sensitive: false }, presence: true 
  
  filterrific(
    available_filters: [
      :sorted_by,
      :search_query
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

    num_or_conds = 2

    where(
      terms.map { |term|
        "(LOWER(banks.bank_name) LIKE ? OR banks.id LIKE ?)"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds  }.flatten
    )

  }

  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^banco_/
      order("LOWER(banks.bank_name) #{ direction }")
    when /^id_/
      order("banks.id #{ direction }")

    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }


  def self.options_for_sorted_by
      [
        ['Código (0-9)', 'id_asc'],
        ['Banco (a-z)', 'banco_asc']
      ]
  end

  def self.options_for_select
    order('LOWER(bank_name)').map { |e| [e.bank_name, e.id] }
  end

 end
