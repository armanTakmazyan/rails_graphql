module Mutations
  class UpdateCompany < BaseMutation
    field :company, Types::CompanyType, null: true
    field :errors, Types::ValidationErrorsType, null: true

    argument :payload, Types::CompanyInputType, required: true
    argument :company_id, ID, required: true

    def resolve(payload:, company_id:, clientMutationId: nil)
      company = Company.find(company_id)

      if company.update(name: payload.name, email: payload.email, logo: payload.logo, website: payload.website)
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
