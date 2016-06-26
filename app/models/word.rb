class Word
  include Neo4j::ActiveNode

  property :text, index: :exact

  before_create do
    self.text = text.underscore
  end
end
