module Types
  class MutationType < Types::BaseObject
    field :update_employee, mutation: Mutations::UpdateEmployee
    field :create_employee, mutation: Mutations::CreateEmployee
    field :delete_employee, mutation: Mutations::DeleteEmployee
    field :delete_company, mutation: Mutations::DeleteCompany
    field :update_company, mutation: Mutations::UpdateCompany
    field :create_company, mutation: Mutations::CreateCompany
    field :sign_in, mutation: Mutations::SignIn
    
  end
end
