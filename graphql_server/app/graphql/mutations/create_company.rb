module Mutations
  class CreateCompany < BaseMutation
    field :company, Types::CompanyType, null: true

    argument :payload, Types::CompanyInputType, required: true

    def resolve(clientMutationId: nil, **args)
      #Utils::BuildErrors.auth_required(context)
      resc_obj = Rescuable.new ->(object, args, context) {
        payload = args[:payload]
        company = Company.new(
          name: payload.name,
          email: payload.email,
          logo: payload.logo,
          website: payload.website
        )

        if company.save
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
