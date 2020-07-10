module Mutations
  class UpdateCompany < BaseMutation
    field :company, Types::CompanyType, null: true

    argument :payload, Types::CompanyInputType, required: true
    argument :company_id, ID, required: true

    def resolve(clientMutationId: nil, **args)
      #Utils::BuildErrors.auth_required(context)
      resc_obj = Rescuable.new ->(object, args, context) {
        company = Company.find(args[:company_id])
        payload = args[:payload]

        if company.update(name: payload.name, email: payload.email, logo: payload.logo, website: payload.website)
          {
            company: company
          }
        else 
          Utils::BuildErrors.build_model_validation_err company
        end
      }

      resc_obj.call(object, args, context)

    end
  end
end
