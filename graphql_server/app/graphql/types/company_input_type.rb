module Types
    class CompanyInputType < BaseInputObject
     description "Attributes for creating or updating a company"
      argument :name, String, required: true
      argument :email, String, required: false
      argument :logo, String, required: false 
      argument :website, String, required: false 
    end
end