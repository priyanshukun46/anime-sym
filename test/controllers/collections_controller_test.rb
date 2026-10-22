require "test_helper"

class CollectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collection = Collection.create!(
      title: "Masterpiece Tier",
      slug: "masterpiece-tier",
      badge: "Staff Pick",
      curator_note: "The absolute best series."
    )
  end

  test "should get collections index" do
    get collections_url
    assert_response :success
    assert_includes response.body, "Masterpiece Tier"
    assert_includes response.body, "Editorial Collections"
  end

  test "should get collection show" do
    get collection_url(@collection)
    assert_response :success
    assert_includes response.body, "Masterpiece Tier"
  end
end
