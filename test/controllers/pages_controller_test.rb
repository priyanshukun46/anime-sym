require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get about page" do
    get about_url
    assert_response :success
    assert_includes response.body, "About"
    assert_includes response.body, "Anime Sym"
    assert_includes response.body, "Strict Official Source Policy: Muse Asia & Muse India Only"
  end
end
