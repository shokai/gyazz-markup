require File.dirname(__FILE__) + '/test_helper.rb'

class TestGyazzMarkup < MiniTest::Unit::TestCase

  def setup
    @gm = GyazzMarkup::Markup.new
  end

  def test_markup_image
    img_url = "http://example.com/foo.png"
    assert @gm.markup_image("[[#{img_url}]]") == "<a href=\"#{img_url}\"><img src=\"#{img_url}\"></a>", 'png image'
    img_url = "http://example.com/foo.jpg"
    assert @gm.markup_image("[[#{img_url}]]") == "<a href=\"#{img_url}\"><img src=\"#{img_url}\"></a>", 'jpg image'
    img_url = "http://example.com/foo.jpeg"
    assert @gm.markup_image("[[#{img_url}]]") == "<a href=\"#{img_url}\"><img src=\"#{img_url}\"></a>", 'jpeg image'
    img_url = "http://example.com/foo.bmp"
    assert @gm.markup_image("[[#{img_url}]]") == "<a href=\"#{img_url}\"><img src=\"#{img_url}\"></a>", 'bmp image'
    img_url = "http://example.com/foo.gif"
    assert @gm.markup_image("[[#{img_url}]]") == "<a href=\"#{img_url}\"><img src=\"#{img_url}\"></a>", 'gif image'
    img_url = "http://example.com/foo.baaarrr"
    assert @gm.markup_image("[[#{img_url}]]") != "<a href=\"#{img_url}\"><img src=\"#{img_url}\"></a>", 'not image'
  end

  def test_markup_url
    url = "http://example.com"
    assert @gm.markup_url("[[#{url}]]") == "<a href=\"#{url}\">#{url}</a>", 'http url'
    url = "https://example.com"
    assert @gm.markup_url("[[#{url}]]") == "<a href=\"#{url}\">#{url}</a>", 'https url'
    url = "ftp://example.com"
    assert @gm.markup_url("[[#{url}]]") != "<a href=\"#{url}\">#{url}</a>", 'not url'
  end

  def test_markup_inner_link
    assert @gm.markup_inner_link("[[foo bar]]") == "<a href=\"http://gyazz.com/test/foo bar\">foo bar</a>", "inner link without gyazz-name"
  end

  def test_markup_inner_link_with_opts
    gm = GyazzMarkup::Markup.new :wiki => 'baz'
    assert gm.markup_inner_link("[[foo bar]]") == "<a href=\"http://gyazz.com/baz/foo bar\">foo bar</a>", "inner link with gyazz-name"

    gm = GyazzMarkup::Markup.new :host => 'http://mygyazz.com', :wiki => 'shokai'
    assert gm.markup_inner_link("[[foo bar]]") == "<a href=\"http://mygyazz.com/shokai/foo bar\">foo bar</a>", "inner link with gyazz-name"
  end

  def test_markup_wiki_link
    assert @gm.markup_wiki_link("[[WikiName::PageName]]") == "<a href=\"http://gyazz.com/WikiName/\">WikiName</a>::<a href=\"http://gyazz.com/WikiName/PageName\">PageName</a>"
    assert @gm.markup_wiki_link("[[Wiki Name::Page Name]]") == "<a href=\"http://gyazz.com/Wiki Name/\">Wiki Name</a>::<a href=\"http://gyazz.com/Wiki Name/Page Name\">Page Name</a>"
  end

  def test_markup_strong
    assert @gm.markup_strong("[[[foo]]]") == "<strong>foo</strong>", "strong"
    assert @gm.markup_strong("[[[foo bar baz]]]") == "<strong>foo bar baz</strong>", "strong with space"
  end

  def test_markup_url_with_title
    assert @gm.markup_url_with_title("[[http://example.com mypage]]") == "<a href=\"http://example.com\">mypage</a>", "url with title"
    assert @gm.markup_url_with_title("[[http://example.com my page]]") == "<a href=\"http://example.com\">my page</a>", "space in title"
  end

  def test_markup_url_with_image
    img_url = "http://example.com/foo.png"
    url = "http://example.com"
    assert @gm.markup_url_with_image("[[#{url} #{img_url}]]") == "<a href=\"#{url}\"><img src=\"#{img_url}\"></a>", "url with png image"
    img_url = "http://example.com/foo.jpg"
    url = "http://example.com"
    assert @gm.markup_url_with_image("[[#{url} #{img_url}]]") == "<a href=\"#{url}\"><img src=\"#{img_url}\"></a>", "url with jpg image"
    img_url = "http://example.com/foo.jpeg"
    url = "http://example.com"
    assert @gm.markup_url_with_image("[[#{url} #{img_url}]]") == "<a href=\"#{url}\"><img src=\"#{img_url}\"></a>", "url with jpeg image"
    img_url = "http://example.com/foo.gif"
    url = "http://example.com"
    assert @gm.markup_url_with_image("[[#{url} #{img_url}]]") == "<a href=\"#{url}\"><img src=\"#{img_url}\"></a>", "url with gif image"
    img_url = "http://example.com/foo.bmp"
    url = "http://example.com"
    assert @gm.markup_url_with_image("[[#{url} #{img_url}]]") == "<a href=\"#{url}\"><img src=\"#{img_url}\"></a>", "url with bmp image"
    img_url = "http://example.com/foo.baz"
    url = "http://example.com"
    assert @gm.markup_url_with_image("[[#{url} #{img_url}]]") != "<a href=\"#{url}\"><img src=\"#{img_url}\"></a>", "url with not image"
  end

end
