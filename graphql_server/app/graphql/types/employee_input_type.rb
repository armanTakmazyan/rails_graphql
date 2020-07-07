module Types
    class EmployeeInputType < BaseInputObject
     description "Attributes for creating or updating a company"
      argument :first_name, String, required: true
      argument :last_name, String, required: true
      argument :email, String, required: false
      argument :phone, String, required: false 
      argument :company_id, ID, required: true 
    end
end