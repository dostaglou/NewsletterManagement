module Types
  class OrderEnum < BaseEnum
    value "id_asc", value: { :id => :asc }
    value "id_desc", value: { :id => :desc }
    value "create_asc", value: { :created_at => :asc }
    value "created_desc", value: { :created_at => :desc }
    value "updated_asc", value: { :updated_at => :asc }
    value "updated_desc", value: { :updated_at => :desc }
  end
end