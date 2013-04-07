require File.dirname(__FILE__) + '/test_helper.rb'

class TestGyazzMarkup < MiniTest::Unit::TestCase

  def test_markup_image
    img_url = "http://example.com/foo.png"
    assert GyazzMarkup::markup_image("[[#{img_url}]]") == "<a href=\"#{img_url}\"><img src=\"#{img_url}\"></a>", 'png image'
    img_url = "http://example.com/foo.jpg"
    assert GyazzMarkup::markup_image("[[#{img_url}]]") == "<a href=\"#{img_url}\"><img src=\"#{img_url}\"></a>", 'jpg image'
    img_url = "http://example.com/foo.jpeg"
    assert GyazzMarkup::markup_image("[[#{img_url}]]") == "<a href=\"#{img_url}\"><img src=\"#{img_url}\"></a>", 'jpeg image'
    img_url = "http://example.com/foo.bmp"
    assert GyazzMarkup::markup_image("[[#{img_url}]]") == "<a href=\"#{img_url}\"><img src=\"#{img_url}\"></a>", 'bmp image'
    img_url = "http://example.com/foo.gif"
    assert GyazzMarkup::markup_image("[[#{img_url}]]") == "<a href=\"#{img_url}\"><img src=\"#{img_url}\"></a>", 'gif image'
    img_url = "http://example.com/foo.baaarrr"
    assert GyazzMarkup::markup_image("[[#{img_url}]]") != "<a href=\"#{img_url}\"><img src=\"#{img_url}\"></a>", 'not image'
  end

  def test_markup_url
    url = "http://example.com"
    assert GyazzMarkup::markup_url("[[#{url}]]") == "<a href=\"#{url}\">#{url}</a>", 'http url'
    url = "https://example.com"
    assert GyazzMarkup::markup_url("[[#{url}]]") == "<a href=\"#{url}\">#{url}</a>", 'https url'
    url = "ftp://example.com"
    assert GyazzMarkup::markup_url("[[#{url}]]") != "<a href=\"#{url}\">#{url}</a>", 'not url'
  end

  def test_markup_inner_link
    assert GyazzMarkup::markup_inner_link("[[foo bar]]") == "<a href=\"http://gyazz.com/test/foo bar\">foo bar</a>", "inner link without gyazz-name"
    assert GyazzMarkup::markup_inner_link("[[foo bar]]", "baz") == "<a href=\"http://gyazz.com/baz/foo bar\">foo bar</a>", "inner link with gyazz-name"
  end

  def test_markup_strong
    assert GyazzMarkup::markup_strong("[[[foo]]]") == "<strong>foo</strong>"
  end

  def test_markup_url_with_title
    assert GyazzMarkup::markup_url_with_title("[[http://example.com mypage]]") == "<a href=\"http://example.com\">mypage</a>"
    assert GyazzMarkup::markup_url_with_title("[[http://example.com my page]]") == "<a href=\"http://example.com\">my page</a>", "space in title"
  end

  def test_markup_url_with_image
    img_url = "http://example.com/foo.png"
    url = "http://example.com"
    assert GyazzMarkup::markup_url_with_image("[[#{url} #{img_url}]]") == "<a href=\"#{url}\"><img src=\"#{img_url}\"></a>"
  end

end
