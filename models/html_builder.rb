class HtmlBuilder

  attr_reader :html

  def initialize()
    @html = ""
  end

  def add( line )
    @html += line + "\n"
  end

end
