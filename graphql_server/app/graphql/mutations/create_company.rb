module Mutations
  class CreateCompany < BaseMutation
    field :company, Types::CompanyType, null: true
    field :errors, Types::ValidationErrorsType, null: true

    argument :payload, Types::CompanyInputType, required: true

    def resolve(payload:, clientMutationId: nil)
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
        {
          errors: company.errors
        }
      end
    end

  end
end
