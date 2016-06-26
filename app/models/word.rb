class Word
  include Neo4j::ActiveNode

  property :text, type: String, constraint: :unique

  before_create do
    self.text = text.underscore
  end
end
