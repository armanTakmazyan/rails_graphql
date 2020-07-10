module Mutations
  class DeleteCompany < BaseMutation
    field :result, String, null: true

    argument :company_id, ID, required: true

    def resolve(clientMutationId: nil, **args)
      #Utils::BuildErrors.auth_required(context)
      resc_obj = Rescuable.new ->(object, args, context) {
        company = Company.find(args[:company_id])

        if company.destroy
          {
            result: "Company #{company.name} deleted!"
          }
        else
          Utils::BuildErrors.build_model_validation_err company
        end
      }

      resc_obj.call(object, args, context)
    end
  end
end
