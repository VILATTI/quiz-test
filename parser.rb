class Parser
  def initialize(page)
    @page = page
  end

  def run
    result = {}
    @page.css('table tbody tr').each do |row|
      result[key(row)] = value(row)
    end
    result
  end

  private

  def key(row)
    row.children[1].content
  end

  def value(row)
    {
      tests:    row.children[3].content,
      passes:   row.children[5].content,
      failures: row.children[7].content,
      pending:  row.children[9].content,
      coverage: row.children[11].content
    }
  end
end
