class CompanyName
  include Neo4j::ActiveNode

  property :text, type: String, constraint: :unique

  before_save do
    self.text = text.underscore
  end

  after_save do
    sanitize.split(/[ ]+/).map { |word| Word.find_or_create(text: word) }
  end

  private

  def sanitize
    self.text
  end
end
