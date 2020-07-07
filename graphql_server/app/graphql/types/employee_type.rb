module Types
  class EmployeeType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :email, String, null: true
    field :phone, String, null: true
    # We may skip the "company" function declaration. Because graphql will notice that on the
    # "object" (def resolve(object, args, context))
    # there is a field of "company" created using the model
    field :company, Types::CompanyType, null: false, description: "Company of employee"
    def company
      object.company 
    end
  end
end
