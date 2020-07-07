module Mutations
  class DeleteEmployee < BaseMutation
    field :result, String, null: true
    field :errors, Types::ValidationErrorsType, null: true

    argument :employee_id, ID, required: true

    def resolve(employee_id:, clientMutationId: nil)
      employee = Employee.find(employee_id)
      
      if employee.destroy
        {
          result: "Company #{employee.first_name} deleted!"
        }
      else 
        {
          errors: employee.errors
        }
      end
      
    end
  end
end
