require_relative('html_builder')

class TableBuilder

  def self.build_table( data, columns=nil )

    if columns == nil
      columns = data.first.keys
    else
      columns.each do |column|
        if !data.first.keys.include?(column)
          raise "Column #{column} is not included in the data: #{data}"
        end
      end
    end

    html = HtmlBuilder.new()
    html.add("<table>")
      html.add("<thead>")
        columns.each do |heading|
          html.add("<th>#{heading}</th>")
        end
      html.add("</thead>")
      data.each do |entry|
        html.add("<tr>")
          columns.each do |column|
            html.add("<td>")
              html.add(entry[column])
            html.add("</td>")
          end
        html.add("</tr>")
      end
    html.add("</table>")

    return html.html
  end

end
