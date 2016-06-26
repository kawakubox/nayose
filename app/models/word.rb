class Word
  include Neo4j::ActiveNode

  property :text, index: :exact
end
