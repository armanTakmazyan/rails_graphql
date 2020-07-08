module Mutations
  class UpdateEmployee < BaseMutation
    field :employee, Types::EmployeeType, null: true
    field :errors, Types::ValidationErrorsType, null: true

    argument :payload, Types::EmployeeInputType, required: true
    argument :employee_id, ID, required: true

    def resolve(payload:, employee_id:, clientMutationId: nil)
      #Utils::BuildErrors.auth_required(context)
      employee = Employee.find(employee_id)

      if employee.update(first_name: payload.first_name, last_name: payload.last_name, email: payload.email, phone: payload.phone, company_id: payload.company_id)
        {
          employee: employee
        }
      else 
        Utils::BuildErrors.build(employee, context)
      end
    end
  end
end
