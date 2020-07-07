module Types
  class QueryType < Types::BaseObject
    # /companies 
    field :companies, [Types::CompanyType], null: false 

    def companies
      Company.all
    end

    field :company, Types::CompanyType, null: false do
      argument :id, ID, required: true  
    end

    def company(id:)
      Company.find(id)
    end


    # /employees 
    field :employees, [Types::EmployeeType], null: false 

    def employees
      if context[:current_user].blank?
        raise GraphQL::ExecutionError.new("Authentication required")
      else
        Employee.all
      end
      
    end

    field :employee, Types::EmployeeType, null: false do
      argument :id, ID, required: true  
    end

    def employee(id:)
      Employee.find(id)
    end

  end
end
