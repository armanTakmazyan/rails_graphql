module Types
  class QueryType < Types::BaseObject
    # /companies 
    field :companies, [Types::CompanyType], null: false 

    def companies
      #Utils::BuildErrors.auth_required context
      Company.all
    end

    field :company, Types::CompanyType, null: false do
      argument :id, ID, required: true
    end

    def company(**args)
      #Utils::BuildErrors.auth_required context
      
      resc_obj = Rescuable.new ->(object, args, context) {
        Company.find(args[:id])
      }

      resc_obj.call(object, args, context)
      
    end


    # /employees 
    field :employees, [Types::EmployeeType], null: false 

    def employees
        #Utils::BuildErrors.auth_required context
        Employee.all
    end

    field :employee, Types::EmployeeType, null: false do
      argument :id, ID, required: true  
    end

    def employee(id:)
      #Utils::BuildErrors.auth_required context
      Employee.find(id)
    end

  end
end
