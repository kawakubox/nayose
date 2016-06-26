class Word
  include Neo4j::ActiveNode

  property :text, type: String, constraint: :unique

  has_many :out, :names, type: :constructs, model_class: :CompanyName, unique: true

  before_create do
    self.text = text.underscore
  end
end
