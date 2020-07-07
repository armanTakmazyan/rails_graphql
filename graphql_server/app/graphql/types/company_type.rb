module Types
  class CompanyType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: true
    field :logo, String, null: true
    field :website, String, null: true

    # We may skip the "employee" function declaration. Because graphql will notice that on the
    # "object" (def resolve(object, args, context))
    # there is a field of "employee" created using the model
    field :employee, [Types::EmployeeType], null: false, description: "Returns a list of employees in the company"
    
  end
end
