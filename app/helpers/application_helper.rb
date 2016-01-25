module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "W Prins Properties").join(" - ")
      end
    end
  end
end
