class Beneficiary < ApplicationRecord
  
  has_many :checks
  belongs_to :holder

  validates :name, :holder_id, presence: true
  
  
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

    num_or_conds = 6

    where(
      terms.map { |term|
        "(         beneficiaries.id             LIKE ? 
                OR LOWER(beneficiaries.name)    LIKE ?
                OR LOWER(beneficiaries.address) LIKE ?
                OR LOWER(beneficiaries.email)   LIKE ?
                OR LOWER(beneficiaries.phone_1) LIKE ?
                OR LOWER(beneficiaries.phone_2) LIKE ?
              )"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds  }.flatten
    )

  }

  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^name_/
      order("LOWER(beneficiaries.name) #{ direction }")
    when /^id_/
      order("beneficiaries.id #{ direction }")

    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }


  def self.options_for_sorted_by
      [
        ['Nome (a-z)', 'name_asc'],
        ['Código (0-9)', 'id_asc']
      ]
  end

  def self.options_for_select
    order('LOWER(name)').map { |e| [e.name, e.id] }
  end


end
