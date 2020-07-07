module Mutations
  class DeleteCompany < BaseMutation
    field :result, String, null: true
    field :errors, Types::ValidationErrorsType, null: true

    argument :company_id, ID, required: true

    def resolve(company_id:, clientMutationId: nil)
      company = Company.find(company_id)
      
      if company.destroy
        {
          result: "Company #{company.name} deleted!"
        }
      else 
        {
          errors: company.errors
        }
      end
      
    end
  end
end
