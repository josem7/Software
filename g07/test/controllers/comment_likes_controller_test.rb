require 'test_helper'

class CommentLikesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get comment_likes_new_url
    assert_response :success
  end

end
