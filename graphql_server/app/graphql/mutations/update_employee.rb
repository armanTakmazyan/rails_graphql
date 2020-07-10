module Mutations
  class UpdateEmployee < BaseMutation
    field :employee, Types::EmployeeType, null: true

    argument :payload, Types::EmployeeInputType, required: true
    argument :employee_id, ID, required: true

    def resolve(clientMutationId: nil, **args)
      #Utils::BuildErrors.auth_required(context)
      resc_obj = Rescuable.new ->(object, args, context) {
        employee = Employee.find(args[:employee_id])
        payload = args[:payload]
        if employee.update(first_name: payload.first_name, last_name: payload.last_name, email: payload.email, phone: payload.phone, company_id: payload.company_id)
          {
            employee: employee
          }
        else 
          Utils::BuildErrors.build_model_validation_err employee
        end
      }
      resc_obj.call(object, args, context)

    end
  end
end
