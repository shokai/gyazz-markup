module GyazzMarkup

  class Markup

    def initialize(opts={})
      @opts = GyazzMarkup::Options.default
      opts.each do |k,v|
        next unless @opts.has_key? k
        next unless v
        @opts[k] = v
      end
    end

    def options
      @opts
    end

    def markup(txt)
      lines = txt.split(/[\r\n]/).delete_if{|line|
        line.empty?
      }

      lines.map do |line|
        line = markup_url_with_image line
        line = markup_image line
        line = markup_strong line
        line = markup_url_with_title line
        line = markup_url line
        line = markup_wiki_link line
        line = markup_inner_link line
      end
    end

    def markup_image(str)
      pat = /\[{2,3}(https?:\/\/[^\s]+)\.(png|jpe?g|gif|bmp)\]{2,3}/
      str !~ pat ? str : str.gsub(pat, "<a href=\"#{$1}.#{$2}\"><img src=\"#{$1}.#{$2}\"></a>")
    end

    def markup_url(str)
      pat = /\[{2}(https?:\/\/[^\s]+)\]{2}/
      str !~ pat ? str : str.gsub(pat, "<a href=\"#{$1}\">#{$1}</a>")
    end

    def markup_inner_link(str)
      pat = /\[{2}(.+)\]{2}/
      str !~ pat ? str : str.gsub(pat, "<a href=\"#{options[:host]}/#{options[:wiki]}/#{$1}\">#{$1}</a>")
    end

    def markup_wiki_link(str)
      pat = /\[{2}([^\/]+)::(.+)\]{2}/
      str !~ pat ? str : str.gsub(pat, "<a href=\"#{options[:host]}/#{$1}/\">#{$1}</a>::<a href=\"#{options[:host]}/#{$1}/#{$2}\">#{$2}</a>")
    end

    def markup_strong(str)
      pat = /\[{3}(.+)\]{3}/
      str !~ pat ? str : str.gsub(pat, "<strong>#{$1}</strong>")
    end

    def markup_url_with_title(str)
      pat = /\[{2}(https?:\/\/[^\s]+)\s(.+)\]{2}/
      str !~ pat ? str : str.gsub(pat, "<a href=\"#{$1}\">#{$2}</a>")
    end

    def markup_url_with_image(str)
      pat = /\[{2}(https?:\/\/[^\s]+)\s(https?:\/\/[^\s]+)\.(png|jpe?g|gif|bmp)\]{2}/
      str !~ pat ? str : str.gsub(pat, "<a href=\"#{$1}\"><img src=\"#{$2}.#{$3}\"></a>")
    end
  end
end
