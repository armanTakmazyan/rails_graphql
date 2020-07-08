module Mutations
  class CreateEmployee < BaseMutation
    field :employee, Types::EmployeeType, null: true

    argument :payload, Types::EmployeeInputType, required: true

    def resolve(payload:, clientMutationId: nil)
      employee = Employee.new(
        first_name: payload.first_name,
        last_name: payload.last_name,
        email: payload.email,
        phone: payload.phone,
        company_id: payload.company_id
      )

      if employee.save
        {
          employee: employee
        }
      else 
        {
          errors: employee.errors
        }
      end
    end
  end
end
