require "test_helper"

class GenresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @genre = Genre.create!(name: "Action", slug: "action", description: "High-octane fights.")
  end

  test "should get genres index" do
    get genres_url
    assert_response :success
    assert_includes response.body, "Action"
    assert_includes response.body, "Browse by Genre"
  end

  test "should get genre show" do
    get genre_url(@genre)
    assert_response :success
    assert_includes response.body, "Action Anime"
  end
end
