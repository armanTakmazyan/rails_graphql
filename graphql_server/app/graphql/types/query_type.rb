module Types
  class QueryType < Types::BaseObject
    # /companies 
    field :companies, [Types::CompanyType], null: false 

    def companies
      #Utils::BuildErrors.auth_required context
      resc_obj = Rescuable.new ->(object, args, context) {
        Company.all
      }
      resc_obj.call(object, args, context)
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
        resc_obj = Rescuable.new ->(object, args, context) {
          Employee.all
        }
        resc_obj.call(object, args, context)
    end

    field :employee, Types::EmployeeType, null: false do
      argument :id, ID, required: true  
    end

    def employee(**args)
      #Utils::BuildErrors.auth_required context
      resc_obj = Rescuable.new ->(object, args, context) {
        Employee.find(args[:id])
      }
      resc_obj.call(object, args, context)
    end

  end
end
