class Word
  include Neo4j::ActiveNode

  property :text, type: String, constraint: :unique

end
