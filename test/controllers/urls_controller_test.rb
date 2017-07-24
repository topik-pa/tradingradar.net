require 'test_helper'

class UrlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @url = urls(:one)
  end

  test "should get index" do
    get urls_url
    assert_response :success
  end

  test "should get new" do
    get new_url_url
    assert_response :success
  end

  test "should create url" do
    assert_difference('Url.count') do
      post urls_url, params: { url: { isin: @url.isin, url10: @url.url10, url1: @url.url1, url2: @url.url2, url3: @url.url3, url4: @url.url4, url5: @url.url5, url6: @url.url6, url7: @url.url7, url8: @url.url8, url9: @url.url9 } }
    end

    assert_redirected_to url_url(Url.last)
  end

  test "should show url" do
    get url_url(@url)
    assert_response :success
  end

  test "should get edit" do
    get edit_url_url(@url)
    assert_response :success
  end

  test "should update url" do
    patch url_url(@url), params: { url: { isin: @url.isin, url10: @url.url10, url1: @url.url1, url2: @url.url2, url3: @url.url3, url4: @url.url4, url5: @url.url5, url6: @url.url6, url7: @url.url7, url8: @url.url8, url9: @url.url9 } }
    assert_redirected_to url_url(@url)
  end

  test "should destroy url" do
    assert_difference('Url.count', -1) do
      delete url_url(@url)
    end

    assert_redirected_to urls_url
  end
end
