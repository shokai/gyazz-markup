module GyazzMarkup

  def self.markup(txt, base="test")
    lines = txt.split(/[\r\n]/).delete_if{|line|
      line.to_s.size < 1
    }

    pats = [
            [ /\[{2,3}(https?:\/\/.+)\.(png|jpe?g|gif|bmp)\]{2,3}/, "<a href=\"#{$1}.#{$2}\"><img src=\"#{$1}.#{$2}\"></a>"],
            [ /\[{2}(https?:\/\/.+)\]{2}/, "<a href=\"#{$1}\">#{$1}</a>"],
            [ /\[\[(.+)\]\]/, "<a href=\"http://gyazz.com/#{base}/#{$1}\">#{$1}</a>"]
           ]

    lines.map do |line|
      line = self.markup_url_with_image line
      line = self.markup_image line
      line = self.markup_strong line
      line = self.markup_url_with_title line
      line = self.markup_url line
      line = self.markup_inner_link(line, base)
    end
  end

  def self.markup_image(str)
    pat = /\[{2,3}(https?:\/\/[^\s]+)\.(png|jpe?g|gif|bmp)\]{2,3}/
    str !~ pat ? str : str.gsub(pat, "<a href=\"#{$1}.#{$2}\"><img src=\"#{$1}.#{$2}\"></a>")
  end

  def self.markup_url(str)
    pat = /\[{2}(https?:\/\/[^\s]+)\]{2}/
    str !~ pat ? str : str.gsub(pat, "<a href=\"#{$1}\">#{$1}</a>")
  end

  def self.markup_inner_link(str, base='test')
    pat = /\[{2}(.+)\]{2}/
    str !~ pat ? str : str.gsub(pat, "<a href=\"http://gyazz.com/#{base}/#{$1}\">#{$1}</a>")
  end

  def self.markup_strong(str)
    pat = /\[{3}(.+)\]{3}/
    str !~ pat ? str : str.gsub(pat, "<strong>#{$1}</strong>")
  end

  def self.markup_url_with_title(str)
    pat = /\[{2}(https?:\/\/[^\s]+)\s(.+)\]{2}/
    str !~ pat ? str : str.gsub(pat, "<a href=\"#{$1}\">#{$2}</a>")
  end

  def self.markup_url_with_image(str)
    pat = /\[{2}(https?:\/\/[^\s]+)\s(https?:\/\/[^\s]+)\.(png|jpe?g|gif|bmp)\]{2}/
    str !~ pat ? str : str.gsub(pat, "<a href=\"#{$1}\"><img src=\"#{$2}.#{$3}\"></a>")
  end
end
